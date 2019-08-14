-module(init_sup).
-author("gxl").

-behaviour(supervisor).

-include("settings.hrl").
-include("record.hrl").


%% API
-export([start_link/0]).

-export([
  add_new_tree/4,
  del_story_sup/1,
  add_attached_uids/2,
  add_detached_uids/2,
  del_attached_uid/2,
  del_detached_uid/2,
  get_all_detached_uids/1,
  get_all_attached_uids/1
        ]).

%% supervisor
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  io:format("Start init_sup supervisor~n"),

  init_ets(),
    
  Children = [],
  RestartStrategy = {one_for_one,3,10},
  {ok, {RestartStrategy, Children}}.

%%%%%%%%%%%%%
init_ets() ->
  ets:new(?STORY_TREE_DATA_ETS, [set, public, named_table, {keypos, 2}]).

add_new_tree(SID, SupPid, AL, DL) ->
  ets:insert(?STORY_TREE_DATA_ETS, 
             #story_tree_data{sid = SID,
                              sup_pid = SupPid,
                              sup_name = story_tree_sup:sup_name(SID),
                              attached_uids = AL,
                              detached_uids = DL}).

del_story_sup(SID) ->
  ets:delete(?STORY_TREE_DATA_ETS, SID).

get_all_attached_uids(SID) ->
  ets:lookup_element(?STORY_TREE_DATA_ETS, SID, #story_tree_data.attached_uids).

get_all_detached_uids(SID) ->
  ets:lookup_element(?STORY_TREE_DATA_ETS, SID, #story_tree_data.detached_uids).

add_attached_uids(SID, UID) ->
  AL1 = get_all_attached_uids(SID),
  AL2 = sets:to_list(sets:from_list([UID|AL1])),
  ets:update_element(?STORY_TREE_DATA_ETS, SID, {#story_tree_data.attached_uids, AL2}).

add_detached_uids(SID, UID) ->
  AL1 = get_all_detached_uids(SID),
  AL2 = sets:to_list(sets:from_list([UID|AL1])),
  ets:update_element(?STORY_TREE_DATA_ETS, SID, {#story_tree_data.detached_uids, AL2}).

del_attached_uid(SID, UID) ->
  AL1 = get_all_attached_uids(SID),
  AL2 = lists:delete(UID, AL1),
  ets:update_element(?STORY_TREE_DATA_ETS, SID, {#story_tree_data.attached_uids, AL2}).

del_detached_uid(SID, UID) ->
  AL1 = get_all_detached_uids(SID),
  AL2 = lists:delete(UID, AL1),
  ets:update_element(?STORY_TREE_DATA_ETS, SID, {#story_tree_data.detached_uids, AL2}).


