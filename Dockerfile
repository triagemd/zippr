FROM triage/rails-app:latest as builder

RUN apt-get update && apt-get install -y build-essential git cmake libcurl4-openssl-dev libzip-dev
RUN git clone https://github.com/planetbeing/partial-zip.git /partial-zip
RUN cd /partial-zip && cmake CMakeLists.txt && make

FROM triage/rails-app:latest

COPY --from=builder /partial-zip/partialzip /usr/local/bin

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install --no-cache --without development test

COPY . /app
