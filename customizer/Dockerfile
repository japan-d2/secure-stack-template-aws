FROM ruby:2.7.0

LABEL "maintainer"="ryof <ryo.furuyama@gmail.com>"

WORKDIR /customizer
COPY Gemfile .
RUN bundle install
COPY customizer.rb /usr/local/bin/customizer
RUN chmod +x /usr/local/bin/customizer

WORKDIR /workdir

ENTRYPOINT ["/usr/local/bin/customizer"]