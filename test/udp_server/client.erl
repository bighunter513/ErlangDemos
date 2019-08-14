-module(client).
-author('gxl').

-export([send/1]).

-include("udp_server.hrl").

-define(SERVER_IP, "localhost").

send(TermData) ->
  {ok, Socket} = gen_udp:open(0, [binary]),
  io:format("client opened socket:~p~n", [Socket]),
  Packet = erlang:term_to_binary(TermData),
  ok = gen_udp:send(Socket, ?SERVER_IP, ?PORT, Packet),
  receive
    {udp, Socket, _, _, Bin} ->
      Data = erlang:binary_to_term(Bin),
      io:format("server ack: ~p~n", [Data])
  after 2000 -> 
    io:format("recv timeout, exit ...")
  end,
  gen_udp:close(Socket).



