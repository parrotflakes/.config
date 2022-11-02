#!/usr/bin/env bash

## FETCH-P.SH
# smol pfetch

COLOR_PRI="$(tput setaf 4)$(tput bold)"
COLOR_SEC="$(tput setaf 15)$(tput bold)"
COLOR_NO="$(tput sgr 0)"

PATH_GENERATOR=~/p-c/ascii-paracord.run

# use ascii generator
FLAG_USEGEN=1

# ascii art
if [ $FLAG_USEGEN -eq 1 ] && [ -x $PATH_GENERATOR ]; then
   COLUMN_LEFT="$( "$PATH_GENERATOR" | sed 's_\\_\\\\_g' | sed 's/^/'$COLOR_SEC'/' | sed 's/$/ /' )"
else
   COLUMN_LEFT=$(sed 's/^/'$COLOR_SEC'/' <<< \
'''\/~/=\\"\  
/~/\==\\"  
~/\-\==\  
/==\-\==  ''')
fi

# login@hostname
STRING_NAMES="$COLOR_PRI$USER$COLOR_NO@$COLOR_PRI$HOSTNAME$COLOR_NO"

TABLE_INFO="""\
   ${COLOR_SEC}os$COLOR_NO $(grep -Po '(?<=PRETTY_NAME=")\w*' < /etc/os-release)
   ${COLOR_SEC}kernel$COLOR_NO $(uname -r | grep -Po '^[^-]*')
   ${COLOR_SEC}uptime$COLOR_NO $(uptime -p | grep -Po '\d+..' | sed 's/\ //' | tr -d '[:space:]')\
      """

# inserts table below login@hostname
COLUMN_RIGHT="$STRING_NAMES\n$(column -t <<< $TABLE_INFO)\n"

printf "\n"
# aligns both columns
tr -d "\t" <<< $(paste <(printf "$COLUMN_LEFT") <(printf "$COLUMN_RIGHT"))
# print one random line from text file
printf "\n$COLOR_PRI\"$(shuf -n 1 ~/.config/scripts/res/splash-messages.txt)\"$NC\n"
printf "\n"
