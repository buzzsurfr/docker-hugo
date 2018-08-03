FROM centos:latest as builder

RUN yum -y update
RUN curl -sL -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.46/hugo_0.46_Linux-64bit.tar.gz && tar zxf hugo.tar.gz hugo

FROM scratch

COPY --from=builder /hugo .

VOLUME /host
WORKDIR /host
EXPOSE 1313

ENTRYPOINT ["/hugo"]
