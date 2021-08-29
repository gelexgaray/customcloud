FROM nextcloud:22.1.0-apache

# Add svg support and some extras
RUN apt-get update ; \
    apt-get install -y \
      nano \
      sudo \
      libmagickcore-dev 

# Copy custom files
COPY ./customizations /tmp/customizations

# Rename entrypoint.sh
RUN mv /entrypoint.sh /entrypoint.std.sh

# Add custom entrypoint scripts and hooks
COPY ./*.sh /

# Fix entrypoint.sh permissions
RUN chown -R www-data:www-data /*.sh ; \
    chmod +x /*.sh  
