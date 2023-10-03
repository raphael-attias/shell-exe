Ctime=$(date +"%d-%m-%Y-%H:%M")
echo $(cat /var/log/auth.log | grep "session opened for user $1" | wc -l) > "number_connection-$Ctime"
tar "-cf" "Backup/$Ctime.tar" "number_connection-$Ctime"
rm "number_connection-$Ctime"
