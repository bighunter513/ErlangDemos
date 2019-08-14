%%%
%%% @doc dynamically add to story_tree_sup
%%%
-module(detached_player_inst).
-behaviour(gen_server).
-author('gxl').

-export([start_link/2]).

-export([init/1
      , handle_call/3
      , handle_cast/2
      , handle_info/2
      , terminate/2
      , code_change/3]).

-export([
   svr_name/2,
   state/2,
   set_private_data/3,
   get_private_data/2,
   attach_to_new_story_sup/4
        ]).

-record(state, {name,
                data
               }).

%% Local Utility
svr_name(SID, UID) ->
  list_to_atom("detached_player_inst_svr_" ++ integer_to_list(SID) ++ "_" ++ integer_to_list(UID)).

%% API 
%%
state(SID, UID) ->
  tools:gen_call(svr_name(SID, UID), {state}).

set_private_data(UID, SID, Data) ->
  tools:gen_call(svr_name(SID, UID), {set_private_data, UID, SID, Data}).
get_private_data(UID, SID) ->
  tools:gen_call(svr_name(SID, UID), {get_private_data}).

%% 游离的副本到达可以进入剧本的时候，带着自己的数据，进入到某个剧本上
attach_to_new_story_sup(UID, SID, NewSup, NewSID) ->
  Data = get_private_data(UID, SID),
  CurSup = story_tree_sup:sup_name(SID),
  ok = story_tree_sup:unlink_detached_player_inst(CurSup, UID, SID),
  ok = story_tree_sup:link_attached_player_inst(NewSup, UID, NewSID, Data),
  io:format("user ~p leave ~p:~p, link to ~p:~p~n", [UID, CurSup, SID, NewSup, NewSID]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_link(SID, UID) ->
  Name = svr_name(SID, UID),
  gen_server:start_link({local, Name}, ?MODULE, [Name], []).

init([Name]) ->
  io:format("~p starting ~n", [Name]),
  process_flag(trap_exit, true),
  {ok, #state{name=Name}}.

handle_cast(_Msg, State) -> {noreply, State}.
handle_call({state}, _From, State) -> 
  io:format("state: ~p~n", [State]),
  {reply, ok, State};
handle_call({set_private_data, UID, SID, Data}, _From, State) ->
  S1 = State#state{data = {UID, SID, Data}},
  {reply, ok, S1};
handle_call({get_private_data}, _From, State) ->
  {reply, State#state.data, State};

handle_call(_Request, _From, State) -> {reply, ok, State}.
terminate(_Reason, _State = #state{name=Name}) -> 
  io:format("~p stopping ~n", [Name]), ok.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, _Extra) -> {ok, State}.

