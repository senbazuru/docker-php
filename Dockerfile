FROM circleci/php:7.1-cli-browsers
MAINTAINER senbazuru

RUN curl -sL bootstrap.pypa.io/get-pip.py | sudo python \
    && sudo pip install awscli

RUN deps='\
         ruby \
         libpng-dev \
         ' \
     && set -x \
     && sudo apt update -qq \
     && sudo apt install -y -qq $deps --no-install-recommends \
     && sudo gem install bundler --no-document \
     && sudo rm -rf /var/lib/apt/lists/* \
     && sudo docker-php-ext-install gd \
     && composer global require hirak/prestissimo

