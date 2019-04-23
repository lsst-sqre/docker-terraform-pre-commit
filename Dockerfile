FROM golang:1.11.4-alpine3.8 as builder

ARG TF_DOCS_BIN=terraform-docs
ARG TF_BIN=terraform
ARG TF_VER=0.11.13

RUN apk add --no-cache --upgrade \
    binutils \
    git \
    && rm -rf /root/.cache

WORKDIR /go/bin

RUN go get github.com/segmentio/terraform-docs
RUN strip "/go/bin/${TF_DOCS_BIN}"

RUN wget https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip
RUN unzip terraform_${TF_VER}_linux_amd64.zip


FROM alpine:3.8

ARG PRE_COMMIT_VER=1.14.2

RUN apk add --no-cache --upgrade \
    bash \
    git \
    perl \
    python3 \
    && pip3 install --upgrade --no-cache-dir pre-commit=="${PRE_COMMIT_VER}" \
    && rm -rf /root/.cache

COPY --from=builder "/go/bin/${TF_DOCS_BIN}" "/bin/${TF_DOCS_BIN}"
COPY --from=builder "/go/bin/${TF_BIN}" "/bin/${TF_BIN}"
