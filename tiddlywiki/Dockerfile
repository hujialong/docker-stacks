# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM node:alpine

LABEL maintainer="hujialong <hjlhust@gmail.com>"

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME [ "/TiddlyWiki" ]
WORKDIR /TiddlyWiki

# Environment Variables
TIDDLYWIKI_PLUGIN_PATH=/TiddlyWiki/plugins
TIDDLYWIKI_THEME_PATH=/TiddlyWiki/themes
TIDDLYWIKI_LANGUAGE_PATH=/TiddlyWiki/languages
TIDDLYWIKI_EDITION_PATH=/TiddlyWiki/editions

# Add init-and-run script
ADD init.sh /usr/local/bin/init.sh
RUN chmod a+x /usr/local/bin/init.sh

# Meta
CMD ["/usr/local/bin/init.sh"]
EXPOSE 8080
