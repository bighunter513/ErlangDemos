-module(story_tree_sup).
-behaviour(supervisor).
-author('gxl').

-export([start_link/1]).

-export([
  start_tree/2,
  auto_stop_tree/2,
  stop_tree/2,
  count_children/1,
  sup_name/1,
  start_new_detached_inst/3,
  start_new_attached_inst/3,
  link_attached_player_inst/4,
  link_detached_player_inst/3,
  unlink_detached_player_inst/3
        ]).

%% callback
-export([init/1]).

-include("settings.hrl").
-include("services.hrl").
-include("record.hrl").

sup_name(SID) ->
  list_to_atom("story_tree_sup_" ++ integer_to_list(SID)).

start_link(SID) when is_integer(SID) ->
  supervisor:start_link({local, sup_name(SID)}, 
                        ?MODULE,
                        [SID]).

%% start common children [story_map, wilditem_server, common_story]
init([SID]) ->

  Children = [common_story_spec(SID),
              story_map_spec(SID),
              wilditem_spec(SID)],
  RestartStrategy = {one_for_one, 3, 10},

  init_sup:add_new_tree(SID, self(), [], []),
  io:format("start tree ~p successful~n", [sup_name(SID)]),

  {ok, {RestartStrategy, Children}}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_tree(AllTreeSup, SID) ->
  start_child(AllTreeSup, story_tree_spec(SID)).

stop_tree(AllTreeSup, SID) ->
  stop_tree(SID),
  remove_child(AllTreeSup, sup_name(SID)),
  init_sup:del_story_sup(SID).

%% @doc When a sub supervisor being asked to shutdown by its' father,
%% it termiates all child processes in revervesed order according to 
%% the respective shutdown specifications and then terminates itself.
auto_stop_tree(AllTreeSup, SID) ->
  remove_child(AllTreeSup, sup_name(SID)),
  init_sup:del_story_sup(SID).

count_children(Sup) ->
  supervisor:count_children(Sup).

start_new_attached_inst(SupRef, UID, SID) ->
  start_child(SupRef, attached_player_inst_spec(UID, SID)).

start_new_detached_inst(SupRef, UID, SID) ->
  start_child(SupRef, detached_player_inst_spec(UID, SID)).

link_detached_player_inst(SupRef, UID, SID) ->
  start_new_detached_inst(SupRef, UID, SID),
  init_sup:add_detached_uids(SID, UID),
  ok.

unlink_detached_player_inst(SupRef, UID, SID) ->
  stop_detached_child(SupRef, SID, UID),
  init_sup:del_detached_uid(SID, UID),
  ok.

link_attached_player_inst(SupRef, UID, SID, Data) ->
  start_new_attached_inst(SupRef, UID, SID),
  init_sup:add_attached_uids(SID, UID),
  attached_player_inst:set_private_data(UID, SID, Data),
  ok.
  

%%%%%%%%%%%%%% Internal Function %%%%%%%%%%%%%%%%
stop_tree(SID) ->
  %% remove all it's child
  Sup = sup_name(SID),
  stop_all_detached(Sup, SID),
  stop_all_attached(Sup, SID),
  stop_wilditem_gen(Sup, SID),
  stop_story_map(Sup, SID),
  stop_common_story(Sup, SID).

stop_common_story(Sup, SID) ->
  remove_child(Sup, common_story:svr_name(SID)).

stop_story_map(Sup, SID) ->
  remove_child(Sup, story_map:svr_name(SID)).

stop_wilditem_gen(Sup, SID) ->
  remove_child(Sup, wilditem_server:svr_name(SID)).

stop_detached_child(Sup, SID, UID) ->
  remove_child(Sup, detached_player_inst:svr_name(SID, UID)).
stop_attached_child(Sup, SID, UID) ->
  remove_child(Sup, attached_player_inst:svr_name(SID, UID)).

stop_all_detached(Sup, SID) ->
  DL = init_sup:get_all_detached_uids(SID),
  lists:foreach(fun(UID) ->
                    stop_detached_child(Sup, SID, UID)
                end, DL).

stop_all_attached(Sup, SID) ->
  AL = init_sup:get_all_attached_uids(SID),
  lists:foreach(fun(UID) ->
                    stop_attached_child(Sup, SID, UID)
                end, AL).

start_child(SupRef, ChildSpec) ->
  {ok, Pid} = supervisor:start_child(SupRef, ChildSpec),
  io:format("child ~p started~n", [Pid]).

remove_child(SupRef, ChildId) ->
  ok = supervisor:terminate_child(SupRef, ChildId),
  ok = supervisor:delete_child(SupRef, ChildId).

%% 子监控树
story_tree_spec(SID) ->
  {sup_name(SID), 
     {story_tree_sup, start_link, [SID]},
     permanent, infinity, supervisor, [story_tree_sup]}.

story_map_spec(SID) ->
  {story_map:svr_name(SID),  %% 地图服务
     {story_map, start_link, [SID]},
     permanent, 2000, worker, [story_map]}.

wilditem_spec(SID) ->
  {wilditem_server:svr_name(SID), %% wilditem 服务器
     {wilditem_server, start_link, [SID]},
     permanent, 2000, worker, [wilditem_server]}.

common_story_spec(SID) ->
  {common_story:svr_name(SID), %% 除map, wilditem外的公共服务
     {common_story, start_link, [SID]},
      permanent, 2000, worker, [common_story]}.

attached_player_inst_spec(UID, SID) ->
  #{id => attached_player_inst:svr_name(SID, UID),
    start => {attached_player_inst, start_link, [SID, UID]},
    restart => permanent,
    shutdown => 2000,
    type => worker,
    modules => [attached_player_inst]
   }.

detached_player_inst_spec(UID, SID) ->
  #{id => detached_player_inst:svr_name(SID, UID),
    start => {detached_player_inst, start_link, [SID, UID]},
    restart => permanent,
    shutdown => 2000,
    type => worker,
    modules => [detached_player_inst]
   }.


























