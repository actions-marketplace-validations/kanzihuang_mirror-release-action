#!/bin/bash

set -eu 

if [[ $# != 4 ]]; then
	echo "Usage: $(basename $0) <branch> <directory> <patterns> <file_count>"
	exit 1
fi

branch="$1"
dir="$2"
patterns="$3"
file_count="$4"

git fetch origin $branch
git switch $branch

files=($(cd "$dir" && ls $patterns))

if [[ ${#files[@]} == $file_count ]]; then
	echo "Expect files downloaded: ${files[@]}"
	exit_code=0
else
	echo "Did not expect files: ${files[@]}"
	exit_code=1
fi

git switch main

exit $exit_code
