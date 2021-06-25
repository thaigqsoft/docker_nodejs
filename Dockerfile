FROM node:10.24.0-slim

RUN ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime
RUN apt-get update && apt install -y nginx software-properties-common iputils-ping net-tools git wget nano rsync rclone htop
# Create app directory
WORKDIR /usr/src/app
ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
#Clear cache
RUN  apt-get -y autoremove && apt clean &&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 8080
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
