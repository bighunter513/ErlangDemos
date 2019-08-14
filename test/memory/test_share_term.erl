-module(test_share_term).
-author('gxl').

-compile(export_all).

%% @doc create a deep list
kilo_byte() ->
  kilo_byte(10, [42]).

kilo_byte(0, Acc) -> Acc;
kilo_byte(N, Acc) ->
  kilo_byte(N-1, [Acc|Acc]).


%% @doc how to test >>>
%% 1> l(test_share_term).
%% {module,test_share_term}
%% 2> test_share_term:test().
%% byte size of binary ret : 1024
%% erts_debug:size of ret : 22
%% erts_debug:flat_size of ret : 4094
%% in ets, erts_debug:size 4094, flat_size 4094
%% ok
test() ->
  io:format("byte size of binary ret : ~p~n", [byte_size(list_to_binary(kilo_byte()))]),
  io:format("erts_debug:size of ret : ~p~n", [erts_debug:size(kilo_byte())]),
  io:format("erts_debug:flat_size of ret : ~p~n", [erts_debug:flat_size(kilo_byte())]),

  T = ets:new(test, []),
  ets:insert(T, {key, kilo_byte()}),
  S = erts_debug:size(element(2, hd(ets:lookup(T, key)))),
  S1 = erts_debug:flat_size(element(2, hd(ets:lookup(T, key)))),
  io:format("in ets, erts_debug:size ~p, flat_size ~p~n", [S, S1]),
  ok.


