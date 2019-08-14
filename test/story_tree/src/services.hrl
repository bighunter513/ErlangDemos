-include("settings.hrl").

% 初始化监控树
-define(CONST_SERICES_CHILDREN_SPEC_LIST,
    [       
     
     {init_sup, % 子监控树，包括：和DB相关的初始化+各种ETS表的初始化
        {init_sup, start_link, []},
        permanent, infinity, supervisor, [init_sup]},

     {top_story_sup, %% in charges of all story_tree_sup
        {top_story_sup, start_link, []},
        permanent, infinity, supervisor, [top_story_sup]}

     ]).

