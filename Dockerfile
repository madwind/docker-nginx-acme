FROM nginx
MAINTAINER madwind.cn@gmail.com

ADD acme_init.sh /

RUN curl -O https://github.com/acmesh-official/acme.sh/archive/refs/heads/master.zip && \
    unzip master.zip -d master && \
    mkdir /etc/acme && \
    cd /master/acme.sh-master  && \
    ./acme.sh --install --config-home /etc/acme && \
    sed -i '3i\sh acme_init.sh' /docker-entrypoint.sh && \
    rm /master \
       /master.zip
