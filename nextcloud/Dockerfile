FROM nextcloud:22.1.0-apache

# Add svg support and some extras
RUN apt-get update && apt-get install -y \
    nano \
    libmagickcore-dev 

# Copy custom files
COPY ./customizations /tmp/customizations

# Rename entrypoint.sh
RUN mv /entrypoint.sh /entrypoint.std.sh

# Add custom entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh

# Fix entrypoint.sh permissions
RUN chown -R www-data:www-data /entrypoint.sh ; \
    chmod +x /entrypoint.sh  
