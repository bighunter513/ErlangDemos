%%%
%%%
-module(wilditem_server).
-behaviour(gen_server).
-author('gxl').

-export([start_link/1]).

-export([init/1
      , handle_call/3
      , handle_cast/2
      , handle_info/2
      , terminate/2
      , code_change/3]).

-export([
   add_wilditem/3,
   deal_wilditem/3,
   svr_name/1
        ]).

-record(state, {name}).

%% Local Utility
svr_name(SID) ->
  list_to_atom("wilditem_svr_" ++ integer_to_list(SID)).

%% API 
%%
add_wilditem(UID, SID, WildItem) ->
  tools:gen_call(svr_name(SID), {add_wilditem, UID, SID, WildItem}).

deal_wilditem(UID, SID, WildItem) ->
  tools:gen_call(svr_name(SID), {deal_wilditem, UID, SID, WildItem}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_link(SID) ->
  Name = svr_name(SID),
  gen_server:start_link({local, Name}, ?MODULE, [Name], []).

init([Name]) ->
  io:format("~p starting ~n", [Name]),
  process_flag(trap_exit, true),
  {ok, #state{name=Name}}.

handle_cast(_Msg, State) -> {noreply, State}.
handle_call({add_wilditem, UID, SID, WildItem}, _From, State) -> 
  io:format("user ~p at story ~p add wilditem ~p~n", [UID, SID, WildItem]),
  {reply, ok, State};
handle_call({deal_wilditem, UID, SID, WildItem}, _From, State) -> 
  io:format("user ~p at story ~p deal wilditem ~p~n", [UID, SID, WildItem]),
  {reply, ok, State};

handle_call(_Request, _From, State) -> {reply, ok, State}.
terminate(_Reason, _State = #state{name=Name}) -> io:format("~p stopping ~n", [Name]), ok.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, _Extra) -> {ok, State}.

