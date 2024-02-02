#!/bin/sh

LIST_OF_FILES=""

for file in "$@"; do
  pre_hash=$(md5sum "$file")
  gofumpt -l -w "$file" >/dev/null
  sed -i -E 's/\t/  /g' "$file"
  post_hash=$(md5sum "$file")
  if [ "$pre_hash" != "$post_hash" ]; then
      LIST_OF_FILES=$(echo $file; echo $LISTOF_FILES)
      echo $file
  fi
done

if [ -n "$LIST_OF_FILES" ]; then
    exit 1
fi
