#!/usr/bin/env bash
# ------------------------------------------------------------------
# AUTH  bensonml
# DATE  2024-06-21
# DESC  a simple bash script to find files that have changed over
#       a given date range (between refstart, refend)
# NOTE  this script currently creates two temp files used for
#       defining the date/time range
# ------------------------------------------------------------------

VERSION=0.1.0
USAGE="Usage: bash fdIndxr.sh > list.txt"

set -o nounset

touch -t 202406200000.00 refstart
touch -t 202406210000.00 refend

find $HOME -type f \
    -not \( -path "$HOME/Library/*" \
	        -o -path "$HOME/LOGs/iterm/*" \
	        -o -path "$HOME/Pictures/Photos Library.photoslibrary/*" \
	        -o -path "$HOME/\.*" \
	        -o -wholename "*.git*" \) \
	-newer refstart \
    \! -newer refend \
    \! -name refend

# note 1: only find where time is after refstart, aka newer than refstart 
# note 2: only find where time is NOT after refend, aka newer than refend 
# note 3: but the file is not itself the refend file
# note 4: does not throw error if one of the path/dirs does not exist
# TODO do not create/use refstart file, refend file
# TODO use an input date (opt), and convert to appropriate syntax to work
