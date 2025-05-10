# Use the official Dart image as the base image
FROM dart:stable AS build

# Set the working directory
WORKDIR /app

# Copy the pubspec files and get dependencies
COPY pubspec.* ./
RUN dart pub get

# Copy the rest of the application files
COPY . .

# Build the Flutter web application
RUN dart pub global activate webdev
RUN dart pub global run webdev build

# Use the official Nginx image to serve the built application
FROM nginx:stable-alpine

# Copy the built files from the build stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
