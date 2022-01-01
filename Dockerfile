FROM irssi
LABEL key="xElementzx"

VOLUME ["/home/user/.autodl", "/home/user/watch"]

#Setup the system
USER root
RUN apt-get update &&\
    apt-get install --yes --no-install-recommends\
        build-essential \
        curl \
        libssl-dev \
        libxml2-dev \
        libz-dev \
        unzip &&\
    curl -L http://cpanmin.us | perl - App::cpanminus &&\ 
    cpanm Archive::Zip \
        Net::SSLeay \
        HTML::Entities \
        XML::LibXML \
        Digest::SHA \
        JSON \
        JSON::XS &&\
    apt-get remove --yes\
        build-essential &&\
    apt-get auto-remove --yes &&\
    apt-get clean &&\
    rm -rf \
        /home/user/.cpanm \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

USER user

# Install autodl-irssi
RUN mkdir -p /home/user/.irssi/scripts/autorun &&\
    cd /home/user/.irssi/scripts &&\
    curl -sL https://api.github.com/repos/autodl-community/autodl-irssi/releases/latest | grep -Po '(?<="browser_download_url": ")(.*-v[\d.]+.zip)' | xargs wget --quiet -O autodl-irssi.zip && \
    unzip -o autodl-irssi.zip &&\
    rm -rf autodl-irssi.zip &&\
    cp autodl-irssi.pl autorun/ &&\ 
    mkdir -p /home/user/.autodl

# Setup autodl-curl-sonarr
ADD "autodl.cfg" "/autodl.cfg"
ADD "autodl-curl-sonarr.sh" "/home/user/autodl-curl-sonarr.sh"
ADD "start.sh" "/start.sh"

CMD ["/start.sh"]