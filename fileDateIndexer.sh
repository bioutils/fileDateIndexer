#!/usr/bin/env bash
# ------------------------------------------------------------------
# AUTH  bensonml
# DATE  2024-06-21
# DESC  a simple bash script to find files that have changed over
#       a given date range (between STARTDATE, ENDDATE)
# NOTE  Takes an optional date for STARTDATE, and an optional ENDDATE
#       both in iso format YYYY-MM-DD
#       if no STARTDATE is provided, will use today
#       if no ENDDATE is provided, it will use 1 day after STARTDATE
#       Uses macos/bsd date, not GNU date
# ------------------------------------------------------------------

VERSION=0.2.0
USAGE="
Usage: bash fileDateIndexer.sh
Usage: bash fileDateIndexer.sh [YYYY-mm-dd]
Usage: bash fileDateIndexer.sh [YYYY-mm-dd] [YYYY-mm-dd]"

# read start date, if nothing passed, use today's date
STARTDATE=$1;
if [[ ! $STARTDATE ]]; then
    STARTDATE=$(date +%Y-%m-%d)
fi

# read end date, if nothing passed, use day after STARTDATE
ENDDATE=$2
if [[ ! $ENDDATE ]]; then
    ENDDATE=$(date -j -v +1d -f "%Y-%m-%d" $STARTDATE +%Y-%m-%d)
fi

# header for output
echo "# FILE INDEX FOR $STARTDATE to $ENDDATE"

find $HOME -type f \
	-not \( -path "$HOME/Library/*" \
	-o -path "$HOME/LOGs/iterm/*" \
	-o -path "$HOME/Pictures/Photos Library.photoslibrary/*" \
	-o -path "$HOME/\.*" \
	-o -wholename "*.git*" \) \
	-newermt $STARTDATE \
	\! -newermt $ENDDATE

