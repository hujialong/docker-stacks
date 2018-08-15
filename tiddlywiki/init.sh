#!/bin/sh
# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
set -e

tiddlywiki_script=$(readlink -f $(which tiddlywiki))

if [ -n "$NODE_MEM" ]; then
    mem_node_old_space=$((($NODE_MEM*4)/5))
    NODEJS_V8_ARGS="--max_old_space_size=$mem_node_old_space $NODEJS_V8_ARGS"
fi

if [ ! -d /var/lib/tiddlywiki/hujlwiki ]; then
  /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script hujlwiki --init server
fi

exec /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script hujlwiki --server 8080 $:/core/save/all text/plain text/html ${USERNAME:-hujl} ${PASSWORD:-'wiki'} 0.0.0.0
