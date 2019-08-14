%% register as a global service of erlang cluster
-module(global_name).
-author('gxl').

-export([start/1, call/2, handle_msg/1]).


start(Name) ->
  Pid = spawn(?MODULE, handle_msg, [Name]),
  global:register_name(Name, Pid).

call(Name, Msg) -> 
  %%Name ! {Msg, self()},  
  global:send(Name, {Msg, self()}),
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
      ?LOG_DEBUG("Name ~p recv: ~p from ~p~n", [Name, Msg, From]),
      From ! {Name, "ack: " ++ byte_size(term_to_binary(Msg))},

      %% Next loop
      handle_msg(Name)
  end.


%%%% Test Case
%% Test Instructions

%% step 1) start several nodes 
%% erl -name node1@localhost -setcookie testcookie 
%% erl -name node2@localhost -setcookie testcookie 
%% erl -name node3@localhost -setcookie testcookie 

%% step 2) on node1, start main service
%% global_name:start(jackie)

%% step 3) on node2 or node3
%% net_adm:ping('node1@192.168.1.253'). 本步骤不做的话，nodes() 里面返回啥子都没得
%% global_name:call(jackie, "msg xxx").














