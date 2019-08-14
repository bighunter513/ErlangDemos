%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Global node monitor center
%%% 全局进程监控中心
%%% center和被监控node 都可见此文件的beam，
%%% center启动后，
%%% 被监控进程只需要 call({register, node()}) 即可
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(monitor_center).
-behaviour(gen_server).
-author('gxl').

-export([call/1]).

-export([start_link/0, init_ets/0]).

-export([init/1
      , handle_call/3
      , handle_cast/2
      , handle_info/2
      , terminate/2
      , code_change/3]).

-record(node_status, {node, status=not_running}).
-record(state, {}).

-define(NODE_STATUS_ETS, node_status_ets).

-define(GLOBAL_SERVER_NAME, {global, ?MODULE}).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_link() ->
  gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).

init_ets() ->
  ets:new(?NODE_STATUS_ETS, [set, named_table, public,
                             {keypos, 2}]),
  io:format("~p init ok~n", [?NODE_STATUS_ETS]).

%% API 
%% @doc register Node to be monitored
call({register, Node}) ->
  tools:gen_call(?GLOBAL_SERVER_NAME, {register, Node});

call({status, Node}) ->
  tools:gen_call(?GLOBAL_SERVER_NAME, {status, Node});

call({demonitor, Node}) ->
  tools:gen_call(?GLOBAL_SERVER_NAME, {demonitor, Node});

call({all_status}) -> 
  tools:gen_call(?GLOBAL_SERVER_NAME, {all_status}).

%% gen_server callbacks
init([]) ->
  io:format("~p starting ~n", [?MODULE]),
  process_flag(trap_exit, true),
  {ok, #state{}}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_call({register, Node}, _From, State) ->
  Reply = case ets:lookup(?NODE_STATUS_ETS, Node) of
    [] ->
      monitor_new_node(Node);

    [#node_status{status=Status}] when Status =/= running -> 
      monitor_new_node(Node);

    [#node_status{status=Status}] when Status =:= running -> 
      already_monitor
  end,
  {reply, Reply, State};

handle_call({status, Node}, _From, State) ->
  case ets:lookup(?NODE_STATUS_ETS, Node) of
    [#node_status{status=Status}] when Status =:= running ->
      {reply, running, State};
    _ -> 
      {reply, not_running, State}
  end;

handle_call({demonitor, Node}, _From, State) ->
  ets:delete(?NODE_STATUS_ETS, Node),
  erlang:monitor_node(Node, false),
  {reply, ok, State};

handle_call({all_status}, _From, State) ->
  List = ets:tab2list(?NODE_STATUS_ETS),
  {reply, List, State};
  
handle_call(_Request, _From, State) -> {reply, ok, State}.
terminate(_Reason, _State) -> io:format("~p stopping ~n", [?MODULE]), ok.

handle_info({nodedown, Node}, State) ->
  io:format("node ~p is DOWN!!! ~n", [Node]),
  ets:delete(?NODE_STATUS_ETS, Node),
  {noreply, State};
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, _Extra) -> {ok, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
monitor_new_node(Node) ->
  try
    erlang:monitor_node(Node, true),
    ets:insert(?NODE_STATUS_ETS, #node_status{node=Node, status=running}),
    ok
  catch Exception ->
    io:format("monitor node ~p failed with ~p~n", [Node, Exception]),
    monitor_failed
  end.

%%%%%%%%%%%%%%% Test Case %%%%%%%%%%%%%%
% 1) start a monitor_center
% erl -sname monitor_center -setcookie testcookie
% monitor_center:init_ets().
% monitor_center:start_link(). 

% 2) start one or several node tobe monitored
% erl -sname node1 -setcookie testcookie
% net_adm:ping('monitor_center@lilith_sgame').
% nodes().
% monitor_center:call({register, node()}).
% monitor_center:call({status, node()}).
% monitor_center:call({demonitor, node()}).

















