-module(pre_compile_proto).
-author('gxl').

-export([start/0]).

-define(GAME_PROTO, "./proto/game.proto").

start() ->
  
  Props = [{output_include_dir, "proto/"}, {output_ebin_dir, "ebin/"}, {output_src_dir, "src/"}],
  
  % 生成相应的hrl和erl文件, only if you wanna see the source 
  ok = protobuffs_compile:generate_source(?GAME_PROTO, Props),
  
  % 生成相应的beam和hrl文件
  ok = protobuffs_compile:scan_file(?GAME_PROTO, Props).







