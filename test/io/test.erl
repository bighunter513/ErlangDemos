%%%
%%% @doc how to control io output when rpc:call
%%%

-module(test).
-export([r/0]).

r() ->
  io:format("group leader: ~p~n", [erlang:group_leader()]),
  io:format("node: ~p~n", [node()]),
  erlang:group_leader(whereis(user), self()),
  io:format("hello world~n").


%% How to test ?
%% 1) start two nodes
%% erl -sname t1
%% erl -sname t2
%%
%% 2) 在t2 执行
%% net_kernel:connect_node('t1@lilith_sgame').
%% rpc:call('t1@lilith_sgame', test, r, []).


