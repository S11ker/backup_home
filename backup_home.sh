#!/bin/bash

DATE=$(date +"Date(%d_%m_%Y)_Time(%H_%M)")

mkdir -p $HOME/backups_home

cd "$HOME"/backups_home || exit

COUNT_FILES=$(ls | wc -l)

if [ "$COUNT_FILES" -eq 4 ]; then
	THE_OLDEST_BACKUP=$(ls -tr | head -n 1)
	rm -f "$THE_OLDEST_BACKUP"
fi

tar -cjf "$(whoami)_home_$DATE.tb2" "$HOME" 2>/dev/null

exit 0
