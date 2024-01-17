FROM nextcloud:28-apache

#### STD Layers
# Customize base image software.
# libmagickcore-dev is required for advanced png manipulation
RUN \
apt-get update ; \
apt-get install -y \
  less \
  sudo \
  libmagickcore-dev 

# Inject entrypoint.sh and std scripts and functions
RUN mv /entrypoint.sh /entrypoint.std.sh  
COPY entrypoint.sh /
COPY functions /functions

# Fix entrypoint.sh permissions
RUN \
chown -R www-data:www-data /*.sh ; \
chmod +x /*.sh  

#### CUSTOM Layers 
# Add custom files
COPY customizations /customizations
COPY scripts.custom /scripts.custom


