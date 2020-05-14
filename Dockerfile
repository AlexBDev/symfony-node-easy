FROM php:7.3

# Install required packages (zip libs are installed to speed up vendor download)
RUN apt-get update && apt-get install -y git libzip-dev zlib1g-dev nodejs npm && apt-get clean
RUN npm install -g yarn
RUN docker-php-ext-install -j$(nproc) zip

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
   php composer-setup.php && \
   php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer

# Install Symfony bin
ADD https://get.symfony.com/cli/installer installer
RUN bash installer && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

WORKDIR /app
ENTRYPOINT ["symfony"] 
