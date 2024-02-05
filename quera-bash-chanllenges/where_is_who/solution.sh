#!/bin/bash

grp=shared
dir=shared_files

sudo groupadd "$grp"

for i in {1..2}; do
    sudo useradd -m -U "user$i"
    sudo usermod -a -G "$grp" "user$i"
done

sudo mkdir /"$dir"
sudo chown "user1:$grp" /"$dir"
sudo chmod 660 /"$dir"

sudo rm -rif /"$dir"
sudo userdel -r user1
sudo userdel -r user2
groupdel "$grp"
