
-module(msg_handler).
-author('gxl').

-export([handle_call/4, handle_info/2]).

handle_call(Socket, Address, Port, BinPacket) ->
  Data = erlang:binary_to_term(BinPacket),
  io:format("receive ~p from [~p:~p]~n", [Data, Address, Port]),
  ack_data(Socket, Address, Port, byte_size(BinPacket)).

handle_info(Socket, Msg) ->
  io:format("recv ~p from socket ~p~n", [Msg, Socket]),
  ok.

ack_data(Socket, IP, Port, Length) ->
  Packet = {ok, Length},
  ok = gen_udp:send(Socket, IP, Port, erlang:term_to_binary(Packet)).





