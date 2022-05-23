FROM kjcain/docker-texlive-full

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /utils

# ensure environment is up to date
RUN apt-get update

# add debian packages necessary
RUN apt-get install -f -y  build-essential
RUN apt-get install -f -y  graphviz
RUN apt-get install -f -y  python3
RUN apt-get install -f -y  python3-pip

# install pandoc
COPY ./pandoc-2.14.2-1-amd64.deb .

RUN dpkg -i ./pandoc-2.14.2-1-amd64.deb

# add the eisvogel template
COPY ./pandoc-latex-template/eisvogel.tex .

RUN mkdir -p /usr/share/pandoc/data/templates

RUN cp -n ./eisvogel.tex /usr/share/pandoc/data/templates/eisvogel.latex

# add python requirements
RUN ln -s /usr/bin/python3 /usr/bin/python

ADD ./requirements.txt ./
RUN python3 -m pip install -r requirements.txt
