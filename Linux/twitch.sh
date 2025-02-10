# screen -S "T" -X quit
# screen -dmUS "T"
# screen -S "T" -X stuff "cd PATH/to/Twitch-Drops-Bot"
screen -S "T" -X stuff "^C"
screen -S "T" -X stuff "\n"
screen -S "T" -X stuff "pkill chromium"
screen -S "T" -X stuff "\n"
screen -S "T" -X stuff "sleep 10"
screen -S "T" -X stuff "\n"
screen -S "T" -X stuff "npm run start"
screen -S "T" -X stuff "\n"

