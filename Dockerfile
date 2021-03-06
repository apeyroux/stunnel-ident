FROM debian

RUN apt update
RUN apt install -y build-essential libssl-dev libident-dev automake libtool

ADD patch/stunnel-identprop-0.30.patch /tmp/stunnel-identprop-0.30.patch
ADD src/stunnel-4.26.tar.gz /src/
# ADD src/stunnel-4.31.tar.gz /src/

WORKDIR /src/stunnel-4.26

CMD patch -f -p1 < /tmp/stunnel-identprop-0.30.patch && \
    libtoolize && aclocal && autoconf && automake --add-missing && \
    ./configure --enable-dh --enable-static LDFLAGS="-static" && make && \
    cp src/stunnel /tmp/bin
