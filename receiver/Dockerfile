# syntax=docker/dockerfile:1

FROM ruby:3
WORKDIR /app
COPY *.rb .
RUN gem install bunny --version ">= 2.13.0"
CMD ["ruby","receiver.rb"]
EXPOSE 5672