#!/bin/bash

zenity --warning --text="Are you sure you want to delete user?"
cat /etc/passwd | grep "/bash" | sed 's/:/ /g' > users
zenity --list --title="BEFORE DELETING USER" --width=600 --height=500 --column="                   USERS" < users
user=$(zenity --entry --text="Username" --title="DELETE USER")
sudo userdel -r $user &> /dev/null
zenity --error --text="$user DELETED" --title="USER REMOVED"
cat /etc/passwd | grep "/bash" | sed 's/:/ /g' > users
zenity --list --title="AFTER DELETING USER" --width=599 --height=500 --column="                   USERS" < users