#build array
readarray -t KEEP_ARRAY < keepfiles.txt
#ignore these files
KEEP_ARRAY+=('keepfiles.txt')
KEEP_ARRAY+=('removefiles.txt')
KEEP_ARRAY+=('diff_files.sh')

#clear outputfile
> removefiles.txt

#main loop
for p in $(ls); do if [[ ! "${KEEP_ARRAY[*]} " =~ "$p" ]]; then echo "$p" >> removefiles.txt; fi done
