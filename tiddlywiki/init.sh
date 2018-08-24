#!/bin/sh
# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
set -e

# Environment Variables
# Search path for ordinary plugins
export TIDDLYWIKI_PLUGIN_PATH=/var/lib/tiddlywiki/hujlwiki/plugins
# Search path for themes
export TIDDLYWIKI_THEME_PATH=/var/lib/tiddlywiki/hujlwiki/themes
# Search path for languages
export TIDDLYWIKI_LANGUAGE_PATH=/var/lib/tiddlywiki/hujlwiki/languages
# Search path for editions (used by the InitCommand)
export TIDDLYWIKI_EDITION_PATH=/var/lib/tiddlywiki/hujlwiki/editions

tiddlywiki_script=$(readlink -f $(which tiddlywiki))

if [ -n "$NODE_MEM" ]; then
    mem_node_old_space=$((($NODE_MEM*4)/5))
    NODEJS_V8_ARGS="--max_old_space_size=$mem_node_old_space $NODEJS_V8_ARGS"
fi

if [ ! -d /var/lib/tiddlywiki/hujlwiki ]; then
  /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script hujlwiki --init server
fi

exec /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script hujlwiki --server 8080 $:/core/save/all text/plain text/html ${USERNAME:-hujl} ${PASSWORD:-'wiki'} 0.0.0.0
