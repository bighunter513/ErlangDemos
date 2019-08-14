#!/bin/bash

USER_ID=gxl
LOCAL_IP=192.168.1.252

cookie_name=story_tree_test

APP_NAME=story_svr_app

#1. build args
##ERL_PARAM=" -config priv/errlog +P 300000"
ERL_PARAM=" -config priv/errlog +P 300000"
#ERL_PARAM+=" -pa ../common/ebin"
#ERL_PARAM+=" -pa ../3rd/crontab/ebin/"
#ERL_PARAM+=" -pa ../3rd/erlang_protobuffs/ebin/"
#ERL_PARAM+=" -pa ../3rd/log4erl/ebin/"
ERL_PARAM+=" -pa ./ebin"
#ERL_PARAM+=" -name story_svr_${GAME_SVR_ID}@${LOCAL_IP}"
ERL_PARAM+=" -name story_tree_${USER_ID}@${LOCAL_IP}"
#ERL_PARAM+=" -setcookie ${cookie_name}"
#ERL_PARAM+=" -mnesia dir 'mnesia_dir'"
ERL_PARAM+=" -smp enable"
ERL_PARAM+=" +K true +S 8" 
ERL_PARAM+=" -env ERL_MAX_PORTS 102400"
#ERL_PARAM+=" -detached"
ERL_PARAM+=" -hidden"

#2. start erlang service, simple deploy server everytime
echo "starting story_svr server ..."
erl -boot start_sasl ${ERL_PARAM} -s ${APP_NAME}


