-module(monitor_test).
-author('gxl').

-export([run/0]).
-export([master_main/0, child_main/0]).

run() ->
  {ok, Master, Child1, Child2} = proc_lib:start_link(?MODULE, master_main, []),
  Master ! go,
  Child1 ! normal,
  Child2 ! exception,
  ok.

master_main() ->
  io:format("master : ~p~n", [self()]),
  Child1 = spawn(?MODULE, child_main, []),
  Child2 = spawn(?MODULE, child_main, []),
  monitor(process, Child1),
  monitor(process, Child2),
  proc_lib:init_ack({ok, self(), Child1, Child2}),
  wait(0).

wait(0) ->
  receive
    go -> wait(1)
  end;
wait(3) -> ok;
wait(C) -> 
  receive
    {'DOWN', _, process, Pid, Info} ->
      io:format("master monitored ~p DOWN: ~p~n", [Pid, Info]),
      wait(C + 1)
  end.

child_main() ->
  io:format("child : ~p~n", [self()]),
  receive
    normal -> ok;  %% 正常退出
    exception ->
      %% 人为搞个异常，让它crash
      true = filelib:is_file("no_this_file")
  end.


