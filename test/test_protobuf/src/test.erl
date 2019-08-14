-module(test).
-author('gxl').

-compile([export_all]).

-include("../proto/game_pb.hrl").

to_bin(IOlist) ->
  iolist_to_binary(IOlist).

encode_person() ->
  Person = #person{age=25, name="John", 
                   gender=male, desp = "haha",
                   dict = [{kv, guild_point, 1}, {kv, skill_point, 2}]
                  },
  to_bin(game_pb:encode_person(Person)).

decode_person(Person) -> 
  game_pb:decode_person(Person).

encode_repeat() ->
  RepeatData = 
  [
   #person{age=25, name="John", gender=male},
   #person{age=23, name="Lucy"},
   #person{age=2, name="Tony", gender=female}
  ],
  Family = #family{person = RepeatData},
  to_bin(game_pb:encode_family(Family)).

decode_repeat() ->
  Data = encode_repeat(),
  game_pb:decode_family(Data).
  

