%%%
%%%
-module(story_map).
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
   enter_chunk/3,
   leave_chunk/3,
   svr_name/1
        ]).

-record(state, {name}).

%% Local Utility
svr_name(SID) ->
  list_to_atom("story_map_svr_" ++ integer_to_list(SID)).

%% API 
%%
enter_chunk(UID, SID, ChunKID) ->
  tools:gen_call(svr_name(SID), {enter_chunk, UID, SID, ChunKID}).

leave_chunk(UID, SID, ChunKID) ->
  tools:gen_call(svr_name(SID), {leave_chunk, UID, SID, ChunKID}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start_link(SID) ->
  Name = svr_name(SID),
  gen_server:start_link({local, Name}, ?MODULE, [Name], []).

init([Name]) ->
  io:format("~p starting ~n", [Name]),
  process_flag(trap_exit, true),
  {ok, #state{name=Name}}.

handle_cast(_Msg, State) -> {noreply, State}.
handle_call({enter_chunk, UID, SID, ChunKID}, _From, State) -> 
  io:format("user ~p at story ~p enter chunk ~p~n", [UID, SID, ChunKID]),
  {reply, ok, State};
handle_call({leave_chunk, UID, SID, ChunKID}, _From, State) -> 
  io:format("user ~p at story ~p leave chunk ~p~n", [UID, SID, ChunKID]),
  {reply, ok, State};

handle_call(_Request, _From, State) -> {reply, ok, State}.
terminate(_Reason, _State = #state{name=Name}) -> 
  io:format("~p stopping ~n", [Name]), ok.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, _Extra) -> {ok, State}.

