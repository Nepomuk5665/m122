#!/bin/bash
# create_users.sh
if [ $# -ne 1 ]; then
    echo "Usage: $0 <userlist_file>"
    exit 1
fi

while read username; do
    useradd "$username"
done < "$1"

#!/bin/bash
# add_user_to_groups.sh
if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <grouplist_file>"
    exit 1
fi

username="$1"
first_line=true

while read groupname; do
    groupadd "$groupname" 2>/dev/null
    if [ "$first_line" = true ]; then
        usermod -g "$groupname" "$username"
        first_line=false
    else
        usermod -a -G "$groupname" "$username"
    fi
done < "$2"

#!/bin/bash
# backup_user_files.sh
if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

username="$1"
current_date=$(date +%Y-%m-%d)
archive_name="${username}_${current_date}.tar.gz"

find / -user "$username" -type f 2>/dev/null | while read file; do
    cp "$file" .
done

tar -czf "$archive_name" *.txt *.log *.conf 2>/dev/null
rm *.txt *.log *.conf 2>/dev/null

#!/bin/bash
# ping_sweep.sh
own_ip=$(ifconfig | grep -oE '192\.168\.[0-9]+\.[0-9]+' | head -1)
subnet=$(echo "$own_ip" | cut -d'.' -f1-3)

> active_hosts.txt

for i in {1..254}; do
    ip="${subnet}.${i}"
    if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
        echo "$ip is up"
        echo "$ip" >> active_hosts.txt
    fi
done

#!/bin/bash
# zurich_events.sh
city="${1:-zurich}"
date_param="${2:-$(date +%Y-%m-%d)}"

url="https://www.eventkalender.ch/konzerte-musicals-shows.cfm?kat=1"
curl -s "$url" | grep -i "$city" | grep "$date_param" | cut -d'>' -f2 | cut -d'<' -f1

#!/bin/bash
# cleanup_trash.sh
rm -f /root/trash/*

#!/bin/bash
# ip_ban.sh
if [ $# -ne 2 ]; then
    echo "Usage: $0 <ban|unban> <ip_range>"
    exit 1
fi

action="$1"
ip_range="$2"

if [ "$action" = "ban" ]; then
    iptables -A INPUT -s "$ip_range" -j DROP
    echo "Banned $ip_range"
elif [ "$action" = "unban" ]; then
    iptables -D INPUT -s "$ip_range" -j DROP 2>/dev/null
    echo "Unbanned $ip_range"
else
    echo "Invalid action. Use 'ban' or 'unban'"
    exit 1
fi

#!/bin/bash
# mass_user_creation.sh
users_file="$1"
groups_file="$2"

while read username; do
    useradd "$username"
    while read groupname; do
        groupadd "$groupname" 2>/dev/null
        usermod -a -G "$groupname" "$username"
    done < "$groups_file"
done < "$users_file"

#!/bin/bash
# setup_directory_structure.sh
mkdir -p /shared/{projects,documents,temp}
mkdir -p /private/user{1,2,3}

chmod 2755 /shared/projects
chmod 2755 /shared/documents
chmod 1777 /shared/temp

chmod 700 /private/user1
chmod 700 /private/user2
chmod 700 /private/user3

chgrp projects /shared/projects
chgrp documents /shared/documents
chgrp users /shared/temp

#!/bin/bash
# grep_exercises.sh
cat > testfile.txt << EOF
alpha1:1alpha1:alp1ha
beta2:2beta:be2ta
gamma3:3gamma:gam3ma
obelix:belixo:xobeli
asterix:sterixa:xasteri
idefix:defixi:ixidef
EOF

grep --color=auto obelix testfile.txt
grep --color=auto 2 testfile.txt
grep --color=auto e testfile.txt
grep --color=auto -v gamma testfile.txt
grep --color=auto -E '[123]' testfile.txt

cut -d':' -f1 testfile.txt
cut -d':' -f2 testfile.txt
cut -d':' -f3 testfile.txt

awk -F':' '{print $(NF-1)}' testfile.txt

#!/bin/bash
# stdin_stdout_exercises.sh
cat > letters.txt << END
a
b
c
d
e
END

ls -z 2> /root/errorsLs.log

echo "test content" > sample.txt
cat sample.txt > output1.txt
cat sample.txt >> output1.txt

whoami > info.txt
id >> info.txt
wc -w < info.txt

#!/bin/bash
# file_operations.sh
mkdir Docs
touch Docs/file{1..10}
rm Docs/*1*
rm Docs/file{2,4,7}
rm Docs/*

mkdir Ordner
touch Ordner/file{1..10}
cp -r Ordner Ordner2
cp -r Ordner Ordner2/Ordner3
mv Ordner Ordner1
rm -rf Docs Ordner1 Ordner2

#!/bin/bash
# network_analysis.sh
dmesg | egrep '[0-9]{4}:[0-9]{2}:[0-9a-f]{2}.[0-9]'
ifconfig | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])'
