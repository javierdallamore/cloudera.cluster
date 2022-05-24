password=vagrant
user=vagrant
while IFS="" read -r host || [ -n "$host" ]
do
	echo "$host"
	ssh-keyscan -H $host >> ~/.ssh/known_hosts
	nohup sshpass -p "$password" ssh $user@$host "hostname && exit" &
done < /data/hosts
