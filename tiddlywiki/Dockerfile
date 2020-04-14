# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM node:alpine

LABEL maintainer="hujialong <hjlhust@gmail.com>"

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME [ "/TiddlyWiki" ]
WORKDIR /TiddlyWiki

# Add init-and-run script
ADD init.sh /usr/local/bin/init.sh
RUN chmod a+x /usr/local/bin/init.sh

# Meta
CMD ["/usr/local/bin/init.sh"]
EXPOSE 8080
