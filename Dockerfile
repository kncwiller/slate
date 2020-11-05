FROM ubuntu:latest

WORKDIR /srv/slate

VOLUME /srv/slate/build
VOLUME /srv/slate/source

EXPOSE 4568

COPY Gemfile .
COPY Gemfile.lock .

RUN apt update \
	&& apt install ruby ruby-dev build-essential libffi-dev zlib1g-dev \
	   liblzma-dev nodejs patch \
	&& gem update --system \
	&& gem install bundler

COPY . /srv/slate

RUN chmod +x /srv/slate/slate.sh

ENTRYPOINT ["bundle install"]
CMD ["bundle exec middleman server"]
