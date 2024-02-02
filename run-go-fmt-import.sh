#!/bin/sh

LIST_OF_FILES=$(goimports -l -w "$@")

# remove tabs, then print a list of affected files if any
for file in $(echo "$LIST_OF_FILES"); do
  sed -i -E 's/\t/  /g' "$file"
  echo "$file"
done

if [ -n "$LIST_OF_FILES" ];then
  exit 1
fi
