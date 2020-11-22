#!/bin/sh
# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
set -e

# Environment Variables
# Search path for ordinary plugins
#export TIDDLYWIKI_PLUGIN_PATH=/Wikis/TiddlyWiki/plugins
# Search path for themes
#export TIDDLYWIKI_THEME_PATH=/Wikis/TiddlyWiki/themes
# Search path for languages
#export TIDDLYWIKI_LANGUAGE_PATH=/Wikis/TiddlyWiki/languages
# Search path for editions (used by the InitCommand)
#export TIDDLYWIKI_EDITION_PATH=/Wikis/TiddlyWiki/editions

tiddlywiki_script=$(readlink -f $(which tiddlywiki))

if [ -n "$NODE_MEM" ]; then
    mem_node_old_space=$((($NODE_MEM*4)/5))
    NODEJS_V8_ARGS="--max_old_space_size=$mem_node_old_space $NODEJS_V8_ARGS"
fi

if [ ! -d  "/Wikis/$WIKINAME" ]; then
  #/usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script $WIKINAME --init server
  /usr/bin/env node $tiddlywiki_script $WIKINAME --init server
fi
fi

#exec /usr/bin/env node $NODEJS_V8_ARGS $tiddlywiki_script $WIKINAME --server \
exec /usr/bin/env node $tiddlywiki_script $WIKINAME --server \
	"$PORT" \
	"$ROOTTIDDLER" \
	"$RENDERTYPE" \
	"$SERVETYPE" \
	"$USERNAME" \
    "$PASSWORD" \
    "$HOST" \
    "$PATHPREFIX"