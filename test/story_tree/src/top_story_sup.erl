-module(top_story_sup).
-author("gxl").

-behaviour(supervisor).
-include("settings.hrl").


%% API
-export([start_link/0]).

%% supervisor
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  io:format("Start ~p supervisor~n", [?MODULE]),
    
  Children = [], %% all children are added dynamically
  RestartStrategy = {one_for_one,3,10},
  {ok, {RestartStrategy, Children}}.
