FROM ruby:2.6-slim

WORKDIR /srv/slate

VOLUME /srv/slate/build
VOLUME /srv/slate/source 

EXPOSE 4567

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

RUN apt-get update \
    && apt-get install -y ruby-dev \
		build-essential \
        libffi-dev \
		zlib1g-dev \
		liblzma-dev \
        nodejs \
		patch \
	&& gem update --system \
    && gem install bundler \
    && bundle install

ENTRYPOINT ["bundle exec middleman server"]
