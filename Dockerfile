FROM httpd
LABEL name "my-docker-deployment"
RUN sudo aptitude purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
RUN sudo add-apt-repository ppa:ondrej/php
RUN apt-get update 
RUN apt-get install -y php5.6 curl git zip libapache2-mod-php5.6 php5.6-mysql php5.6-cli 
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY Utils /var/www/Utils
COPY api /var/www/api
COPY assets /var/www/assets
COPY index.html /var/www/index.html

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
