FROM ubuntu:jammy-20220428

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /utils

ADD ./setup_environment.sh ./
ADD ./pandoc-latex-template/ ./

RUN ./setup_environment.sh
