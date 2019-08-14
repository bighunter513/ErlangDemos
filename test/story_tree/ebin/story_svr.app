{application, story_svr,
  [{description, "one of many Story Server for BigWorld!"},
  {vsn,"1.0"},
  {modules, [init_sup, story_svr_app, story_svr_sup]},
  {registered, [story_svr]},
  {applications, [kernel, stdlib]},
  {mod, {story_svr_app, []}},
  {env, [
    {debug, true},
    {version, "1.0.4"},
    {svr_type, story_svr},
    {svr_id, 20},
    {center_node, 'server_center_20@192.168.1.252'},
    {region, cn}
    ]
  }]
}.
