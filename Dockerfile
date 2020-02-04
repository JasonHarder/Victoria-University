FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev apt-transport-https


# Add Yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Yarn for webpacker asset compiling
RUN apt-get update -qq && apt-get install -y yarn

# webpacker gets all our files and makes sure they can render in browser
# (i.e if you use SCSS vs CSS since SCSS can't directly render)

# Install gems and copy code to the container(this creates a directory to run whats needed)
RUN mkdir /Victoria-University
WORKDIR /Victoria-University
COPY Gemfile /Victoria-University/Gemfile
COPY Gemfile.lock /Victoria-University/Gemfile.lock
RUN bundle install
COPY . /Victoria-University
# Migrate and compile assets
RUN bundle exec rails db:migrate
RUN bundle exec rails assets:clean
RUN bundle exec rails assets:precompile
# Start the server
EXPOSE 3000
CMD bundle exec rails s -p 3000 -b '0.0.0.0'

# expose the port so we can access it from our computer ^^ (we are saying expose 3000 to the rest of the world)
# containers are self contained and you dont locally need a version of something and can actually s