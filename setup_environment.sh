# ensure environment is up to date
apt-get update

# add debian packages necessary
apt-get install -f -y --no-install-recommends \
    pandoc \
    texlive-latex-extra \
    build-essential \
    graphviz \
    python3 \
    python3-pip

ln -s /usr/bin/python3 /usr/bin/python

# add panflute for custom filters
python3 -m pip install panflute natsort

# install latex plugins
tlmgr init-usertree

tlmgr option repository ftp://tug.org/historic/systems/texlive/2021/tlnet-final

tlmgr install \
    adjustbox \
    babel-german \
    background \
    bidi \
    collectbox \
    csquotes \
    everypage \
    filehook \
    footmisc \
    footnotebackref \
    framed \
    fvextra \
    letltxmacro \
    ly1 \
    mdframed \
    mweights \
    needspace \
    pagecolor \
    sourcecodepro \
    sourcesanspro \
    titling \
    ucharcat \
    ulem \
    unicode-math \
    upquote \
    xecjk \
    xurl \
    zref

# add the eisvogel template
mkdir -p /usr/share/pandoc/data/templates

cp -n pandoc-latex-template/eisvogel.tex /usr/share/pandoc/data/templates/eisvogel.latex
