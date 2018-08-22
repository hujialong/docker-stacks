# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM node:alpine

LABEL maintainer="hujialong <hjlhust@gmail.com>"

# Environment Variables
# Search path for ordinary plugins
ENV TIDDLYWIKI_PLUGIN_PATH /var/lib/tiddlywiki/plugins
# Search path for themes
ENV TIDDLYWIKI_THEME_PATH /var/lib/tiddlywiki/themes
# Search path for languages
ENV TIDDLYWIKI_LANGUAGE_PATH /var/lib/tiddlywiki/languages
# Search path for editions (used by the InitCommand)
ENV TIDDLYWIKI_EDITION_PATH /var/lib/tiddlywiki/editions

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD init.sh /usr/local/bin/init.sh
RUN chmod a+x /usr/local/bin/init.sh

# Meta
CMD ["/usr/local/bin/init.sh"]
EXPOSE 8080
