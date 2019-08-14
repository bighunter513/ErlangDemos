-module(story_svr_supervisor).
-author("gxl").

-behaviour(supervisor).

-include("settings.hrl").
-include("services.hrl").

%% API
-export([start_link/0]).

%% supervisor
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% 注册监控树
init([]) ->

  % 初始化监控树
  Children = ?CONST_SERICES_CHILDREN_SPEC_LIST,

  RestartStrategy = {one_for_one, 0, 1},  % 不会重启，这样便于暴露错误
  %RestartStrategy = {one_for_one, 30, 10}, % 30s内重启子进程10次
  {ok, {RestartStrategy, Children}}.

