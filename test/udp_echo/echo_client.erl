-module(echo_client).
-author('gxl').

-export([echo/1]).

-define(SERVER_IP, "localhost").
-define(SERVER_PORT, 4377).

echo(TermData) ->
  {ok, Socket} = gen_udp:open(0, [binary]),
  io:format("client opened socket:~p~n", [Socket]),
  Packet = erlang:term_to_binary(TermData),
  ok = gen_udp:send(Socket, ?SERVER_IP, ?SERVER_PORT, Packet),
  receive
    {udp, Socket, _, _, Bin} ->
      Data = erlang:binary_to_term(Bin),
      io:format("client received: ~p~n", [Data])
  after 2000 -> 
    io:format("recv timeout, exit ...")
  end,
  gen_udp:close(Socket).



