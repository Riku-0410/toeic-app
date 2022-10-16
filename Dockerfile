FROM ruby:3.1.2
RUN mkdir /toeic-app
WORKDIR /toeic-app
COPY Gemfile /toeic-app/Gemfile
COPY Gemfile.lock /toeic-app/Gemfile.lock
RUN bundle install
COPY . /toeic-app
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
