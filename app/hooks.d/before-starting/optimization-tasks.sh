#!/bin/bash
. /_/shlib/occ.sh

occ maintenance:repair --include-expensive
occ db:add-missing-indices
