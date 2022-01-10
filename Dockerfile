# You can take any ubuntu image as well
FROM cirrusci/flutter

# Setup
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl python3 && apt-get upgrade -y && rm -rf /var/cache/apt

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter doctor -v

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Record the exposed port
EXPOSE 5000

RUN apt-get install dos2unix
RUN dos2unix /app/server/server.sh

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]