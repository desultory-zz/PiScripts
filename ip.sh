#!/bin/bash
#Fill in user which is ssh user, host which is ssh host, and dir which is the directory on the remote server where you want to put the file containing your ip a information and timestamp
user=
host=
dir=
ip a > ip
echo $(date) >> ip
scp ip "$user"@"$host":"$dir"
rm ip
