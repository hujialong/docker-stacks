# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
# tiddwywiki 5.2.0
FROM node:alpine

LABEL maintainer="hujialong <hjlhust@gmail.com>"

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME [ "/Wikis" ]
WORKDIR /Wikis

EXPOSE 8080

ENV WIKINAME TiddlyWiki
ENV PORT 8080
ENV ROOTTIDDLER $:/core/save/all
ENV RENDERTYPE text/plain
ENV SERVETYPE text/html
ENV USERNAME hujl
ENV PASSWORD "wiki"
ENV HOST 0.0.0.0
ENV PATHPREFIX ""

# Add init-and-run script
ADD init.sh /usr/local/bin/init.sh
RUN chmod a+x /usr/local/bin/init.sh

# Meta
CMD ["/usr/local/bin/init.sh"]