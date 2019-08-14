%% Copyright
-module(story_svr_app).
-author("gxl").

-behaviour(application).

% application
-export([start/0, stop/0, start/2, stop/1]).

% 用于Makefile启动进程
start() ->
  case application:start(story_svr) of
    ok ->
      io:format("story_svr app start successfully...");
    {error, Reason} -> 
      io:format("story_svr app start failed, reason ~p~n", [Reason]),
      stop()
  end.

stop() ->
  io:format("story_svr app stopped~n"),
  erlang:halt().

% application callbacks
start(_Type, _Args) ->
  case story_svr_supervisor:start_link() of
    {ok, Pid} -> {ok, Pid};
    Other -> {error, Other}
  end.


stop(_State) ->
  ok.
