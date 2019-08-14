-module(test_ets).
-author('gxl').

-include_lib("stdlib/include/ms_transform.hrl").

-export([
    init_ets/0,
    test_fun2ms/0,
    test_match/0,
    test_match_object/0,
    test_large_ets/1,
    test_match_delete/0,
    test_file2tab/0,
    gen_uin/1,
    for/3
 ]).

init_ets() ->
  case ets:info(test) of 
    undefined ->
      ets:new(test, [set, public, named_table]),
      ets:insert(test, {{game, 1}, 'game_1@127.0.0.1'}),
      ets:insert(test, {{game, 2}, 'game_2@127.0.0.1'}),
      ets:insert(test, {{game, 3}, 'game_3@127.0.0.1'}),
      ets:insert(test, {{login, 1}, 'login_1@127.0.0.1'}),
      ets:insert(test, {{login, 5}, 'login_5@127.0.0.1'});
    _ -> void
  end.

test_fun2ms() ->
  init_ets(),  
  MS = ets:fun2ms(fun({{Type, ID},Addr}) 
      when Type =:= game, ID =/= 0 ->
        {ID, Addr}
    end),
  ets:select(test, MS).

test_match_object() ->
  init_ets(),
  ets:match_object(test, {{game, '_'}, '_'}).

test_match() ->
  init_ets(),
  ets:match(test, {{game, '$1'}, '$2'}).

test_match_delete() ->
  init_ets(),
  ets:match_delete(test, {{'_', 1}, '_'}).

test_file2tab() ->
  Filename = "./test_ets_tab2file.data",
  Tab = ets:new(test_ets_new, [named_table, ordered_set]),
  [ets:insert(Tab, {N, erlang:now()}) || N <- lists:seq(1, 10)],
  ets:tab2file(Tab, Filename, [{extended_info, [md5sum]}]),

  ets:delete(test_ets_new),
  {ok, T1} = ets:file2tab(Filename),
  ets:tab2list(T1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
test_large_ets(N) -> %% N maybe 1kw, 3kw, 10kw
  ets:new(large_ets, [set, named_table, public, compressed]),
  for(1, N, fun(X) -> ets:insert(large_ets, {gen_uin(X), X}) end),
  %% 1kw 条记录需要 2.8G内存， 压缩无变化，因为key本身需要那么多空间，value纯数字，无压缩空间...
  io:format("after insert ~p dict, ets size: ~p~n", [N, ets:info(large_ets, size)]).

gen_uin(N) ->
  "debug-" ++ integer_to_list(N).


for(N, N, F) -> F(N);
for(M, N, F) ->
  F(M),
  for(M+1, N, F).




