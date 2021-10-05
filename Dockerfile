FROM httpd
LABEL name "my-docker-deployment"
RUN apt-get update 
RUN apt-get install -y php5 curl git zip libapache2-mod-php5 php5-mysql php5-cli 
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY Utils /var/www/Utils
COPY api /var/www/api
COPY assets /var/www/assets
COPY index.html /var/www/index.html

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
