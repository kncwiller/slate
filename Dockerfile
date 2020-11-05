FROM ubuntu:latest

WORKDIR /srv/slate

VOLUME /srv/slate/build
VOLUME /srv/slate/source

EXPOSE 4567

COPY Gemfile .
COPY Gemfile.lock .
COPY . /srv/slate

RUN apt update \
	&& apt install -y ruby ruby-dev build-essential libffi-dev zlib1g-dev \
	   liblzma-dev nodejs patch \
	&& gem update --system \
	&& gem install -y bundler \
	&& bundle install

RUN chmod +x /srv/slate/slate.sh

CMD ["bundle exec middleman server"]
