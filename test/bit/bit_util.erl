-module(bit_util).
-author('gxl').

-export([
   set/2,
   bit_value/2,
   zip/1,
   unzip/1
        ]).

-export([test01/0]).

%% 
%% @doc set the bit at position N to 1
%%
-spec set(Bin :: binary(), N :: non_neg_integer()) -> binary().
set(Bin, N) when N > 0 ->
  Before = N-1,
  fun( <<L:Before/bits, _:1, R/bits>> ) ->
      <<L/bits, 1:1, R/bits>>
  end(Bin).

%% 
%% @doc get the bit value at position N
%%
-spec bit_value(Bin :: binary(), N :: non_neg_integer()) -> binary().
bit_value(Bin, N) when N > 0 ->
  Before = N - 1,
  <<_:Before/bits, Bit:1, _/bits>> = Bin,
  Bit.
 
%% zip a binary 
zip(Bin) ->
  L = binary_to_list(Bin),
  zlib:zip(L).

%% uncompress a binary to binary
unzip(B)  ->
  zlib:unzip(B).

test01() ->
  L = [ X rem 255 || X <- lists:seq(1, 10000) ],
  B = list_to_binary(L),
  B1 = zip(B),
  io:format("L len 10000, after zip ,len is ~p~n", [byte_size(B1)]),
  B =:= unzip(binary_to_list(B1)).

