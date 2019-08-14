-module(local_name).
-author('gxl').

-export([start/1, call/2, handle_msg/1]).

-export([test/0]).

start(Name) ->
  Pid = spawn(?MODULE, handle_msg, [Name]),
  register(Name, Pid).

call(Name, Msg) -> 
  Name ! {Msg, self()},  %% 以名字方式向本地进程发消息
  receive
    {Name, Reply} -> Reply
  end.

%%%%%%%%%%%%%%%%%%%%%%%%%%% Process loop  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Name 进程函数体
handle_msg(Name) ->
  receive
    {stop, From} ->
      From ! {Name, stopped}; %% 通知调用者 Name进程 stop，退出handle_msg 循环
    
    {Msg, From} ->
      io:format("recv: ~p from ~p~n", [Msg, From]),
      From ! {Name, "ack: " ++ byte_size(term_to_binary(Msg))},

      %% Next loop
      handle_msg(Name)
  end.


%%%% Test Case
test() ->
  start(handsome), 
  io:format("service handsome pid is ~p~n", [whereis(handsome)]),
  call(handsome, "nihao~"),
  call(handsome, "屌丝你好"),
  call(handsome, {abc, "test", [1,3,2]}),
  call(handsome, stop),
  io:format("after stop, handsome pid is ~p~n", [whereis(handsome)]),
  ok.
  















