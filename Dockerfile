FROM ubuntu

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

VOLUME /app/build
VOLUME /app/source 

EXPOSE 4567

COPY . /app

RUN chmod +x /app/slate.sh

RUN apt-get update \
    && apt-get install -y ruby \
	    ruby-dev \
		build-essential \
        libffi-dev \
		zlib1g-dev \
		liblzma-dev \
        nodejs \
		patch \
	&& gem update --system \
    && gem install bundler \
    && bundle install

CMD ["bundle exec middleman server"]
