#!/bin/sh
occ() {
  # When running occ with sudo, -E must be used to pass PHP_MEMORY_LIMIT
  # and the rest of the root environament into www-data environment
  # and avoid out of memory errors
  sudo -E -u www-data /var/www/html/occ $@
}

