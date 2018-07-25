# Copyright (c) Jialong Hu.
# Distributed under the terms of the Modified BSD License.
FROM deskor/xrdp

LABEL maintainer="hujialong <hjlhust@gmail.com>"

RUN apt-get update \
    && apt-get install -yq firefox \
    && apt-get install -yq thunderbird
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y
    
CMD ["thunderbird"]
