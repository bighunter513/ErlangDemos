-module(echo_server).
-export([start/1]).

start(ListenPort) ->
  proc_lib:spawn(fun() -> server(ListenPort) end).

server(ListenPort) ->
  {ok, Socket} = gen_udp:open(ListenPort, [binary, {active, false}]),
  io:format("server opened socket: ~p~n", [Socket]),
  loop(Socket).

loop(Socket) -> 
  inet:setopts(Socket, [{active, once}]),
  receive
    {udp, Socket, Host, Port, Bin} -> 
      io:format("server received: ~p~n", [Bin]),
      gen_udp:send(Socket, Host, Port, Bin),
      loop(Socket)
  end.




