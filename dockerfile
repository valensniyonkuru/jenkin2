FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/
COPY ./index.html /var/www/html/index.html
COPY ./style.css /var/www/html/style.css
CMD ["nginx", "-g", "daemon off;"]
