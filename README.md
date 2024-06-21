# NAME  
fileDateIndexer.sh

## DESCRIPTION
A simple bash script to find files that have changed over a given date range (between refstart, refend).

The script has a list of paths that are *excluded* from the search: such as `.git` or `$HOME/Pictures/Photos Library.photoslibrary/`.

## NOTES  
1. This script currently creates two temp files used for defining the date/time range: refstart, refend.
2. To change the date range, edit the script, e.g.  `touch -t 202406200000.00 refstart`
3. For now, the times for refstart and refend are currently hard coded in the script.
4. No error is thrown if an excluded path/dir listed does not exist.

## USAGE
    bash fileDateIndexer.sh > 2024-06-20.list
  
