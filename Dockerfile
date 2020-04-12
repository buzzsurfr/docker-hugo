FROM centos:latest as builder

RUN yum -y update
RUN curl -sL -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.68.3/hugo_0.68.3_Linux-64bit.tar.gz && tar zxf hugo.tar.gz hugo

FROM scratch

COPY --from=builder /hugo .
ADD ca-certificates.crt /etc/ssl/certs/

VOLUME /host
WORKDIR /host
EXPOSE 1313

ENTRYPOINT ["/hugo"]
