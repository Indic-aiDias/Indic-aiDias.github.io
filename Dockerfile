# Use the official Ruby image from the Docker Hub
FROM ruby:3.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install the gems specified in the Gemfile
RUN gem install bundler -v 2.6.6 --source http://rubygems.org

RUN bundle install

# Copy the rest of the application code into the image
COPY . .

# Expose port 4000 to the host
EXPOSE 4000

# Command to run the Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]