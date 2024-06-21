NAME  
fileDateIndexer.sh

DESCRIPTION
A simple bash script to find files that have changed over a given date range (between refstart, refend).
The script has a list of paths that are *excluded* from the search: such as `.git` or `$HOME/Pictures/Photos Library.photoslibrary/`.

NOTES  
1. This script currently creates two temp files used for defining the date/time range: refstart, refend.
2. For now, the times for refstart and refend are currently hard coded in the script.
3. No error is thrown if an excluded path/dir listed does not exist.
