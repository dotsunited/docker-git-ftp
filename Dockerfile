FROM alpine:latest

RUN apk update \
    && apk add bash \
    && apk add make \
    && apk add curl \
    && apk add git

WORKDIR /opt/git-ftp/

RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
    && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
    && git checkout "$tag" \
    && make install

CMD ["bash"]
