-module(performance_test).
-author('gxl').

-compile([export_all]).

-include("../proto/game_pb.hrl").

-record(user_record, {uid,
                      name,
                      gender,
                      bags = [],
                      heroes = [],
                      skills = []
                     }).

init() ->
  {A, B, C} = erlang:now(),
  random:seed(A, B, C).

random(M, N) ->
  R = random:uniform(),
  M + round(R * (N-M)).

to_bin(IOlist) ->
  iolist_to_binary(IOlist).

%% Ration can be 10, 100, 1000 for performance
make_user(Ratio) ->
  #user_record{uid = random(1, 10000000),
               name = "test_xxx_wo",
               gender = male,
               bags = make_kv_list(Ratio),
               heroes = make_kv_list(Ratio),
               skills = make_kv_list(Ratio)
              }.

pb_user(RecordUser) when is_record(RecordUser, user_record) ->
  setelement(1, RecordUser, user).

make_kv_list(Num) ->
  [{int_kv, K, 2*K} || K <- lists:seq(1, Num)].


encode_user_record(User) when is_record(User, user_record) ->
  term_to_binary(User).
decode_user_record(UserBin) ->
  binary_to_term(UserBin).

encode_user_pb(User) when is_record(User, user) ->
  to_bin(game_pb:encode_user(User)).
decode_user_pb(Bin) ->
  game_pb:decode_user(Bin).

encode_benchmark(UserRatio, EncodeTimes) ->
  init(), 
  U1 = make_user(UserRatio),
  U2 = pb_user(U1),
  
  {ok, _Pid} = eprof:start(),
  profiling = eprof:start_profiling([self()]),
  
  {T1, _} = timer:tc(?MODULE, encode1, [U1, EncodeTimes]),
  {T2, _} = timer:tc(?MODULE, encode2, [U2, EncodeTimes]),

  profiling_stopped = eprof:stop_profiling(),
  eprof:log("encode_eprof.log"),
  eprof:analyze(procs, [{sort, time}]),
  eprof:stop(),

  io:format("encode ~p times, cost ~p (term) vs ~p (pb)", [EncodeTimes, T1, T2]).

decode_benchmark(UserRatio, DecodeTimes) ->
  init(),
  U1 = make_user(UserRatio),
  U2 = pb_user(U1),

  B1 = encode_user_record(U1),
  B2 = encode_user_pb(U2),
  
  {ok, _Pid} = eprof:start(),
  profiling = eprof:start_profiling([self()]),
  
  {T1, _} = timer:tc(?MODULE, decode1, [B1, DecodeTimes]),
  {T2, _} = timer:tc(?MODULE, decode2, [B2, DecodeTimes]),

  profiling_stopped = eprof:stop_profiling(),
  eprof:log("decode_eprof.log"),
  eprof:analyze(procs, [{sort, time}]),
  eprof:stop(),

  io:format("decode ~p times, cost ~p (term) vs ~p (pb)", [DecodeTimes, T1, T2]).

encode1(User, Times) ->
  [encode_user_record(User) || _X <- lists:seq(1, Times)].
encode2(PbUser, Times) ->
  [encode_user_pb(PbUser) || _X <- lists:seq(1, Times)].

decode1(B1, Times) ->
  [decode_user_record(B1) || _X <- lists:seq(1, Times)].
decode2(B2, Times) ->
  [decode_user_pb(B2) || _X <- lists:seq(1, Times)].



  






