# Stage 1: Build
FROM ubuntu:20.04 AS build-env

# Install dependencies for Flutter
RUN apt-get update && \
    apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 && \
    apt-get clean

# Clone Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter config --enable-web

# Get latest stable
RUN flutter channel stable
RUN flutter upgrade

# Copy app files
WORKDIR /app
COPY . .

# Get dependencies
RUN flutter pub get

# Build
RUN flutter build web --release

# Stage 2: Serve
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY ./server/nginx.conf /etc/nginx/nginx.conf

# Expose port and start
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
