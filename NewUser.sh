#!/bin/bash

cat /etc/passwd | grep "/bash" | sed 's/:/ /g' > users
zenity --list --title="BEFORE ADDING NEW USER" --width=600 --height=500 --column="                   USERS" < users
userdet=$(zenity --username --password --title="Login")
user=$(echo $userdet | cut -d"|" -f1)
password=$(echo $userdet | cut -d"|" -f2)
sudo useradd -m $user
echo $password | sudo passwd $user --stdin &> /dev/null
zenity --info --title="User $user created" --text="SUCCESS"
cat /etc/passwd | grep "/bash" | sed 's/:/ /g' > users
zenity --list --title="AFTER ADDING USER" --width=600 --height=500 --column="                   USERS" < users
