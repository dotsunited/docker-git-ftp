FROM curlimages/curl-base:8.9.1

# move libcurl files to /tmp, otherwise it will be overwritten by the apk add
RUN mv /usr/lib/libcurl.so* /tmp

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add bash git make --no-cache

# restore libcurl files
RUN mv /tmp/libcurl.so* /usr/lib

RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
    && cd /opt/git-ftp \
    && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
    && git checkout "$tag" \
    && make install \
    && rm -rf /opt/git-ftp

CMD ["bash"]
