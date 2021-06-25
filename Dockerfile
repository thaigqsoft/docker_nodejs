FROM node:14.17.1-slim
# edit 3
RUN ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime
RUN apt-get update && apt install -y nginx software-properties-common iputils-ping net-tools git wget nano rsync rclone htop
# Create app directory
WORKDIR /usr/src/app
ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
#Clear cache
RUN apt-clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 8080
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
