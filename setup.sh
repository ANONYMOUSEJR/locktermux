#!/data/data/com.termux/files/usr/bin/bash

pkg install python -y
cp login.py $PREFIX/bin/
chmod 700 $PREFIX/bin/login.py
cp login $PREFIX/bin/
chmod 700 $PREFIX/bin/login
mkdir /data/data/com.termux/files/usr/share/login/
clear

#TODO: add a while loop so that the program doesnt have to be run every time the passwords dont match...
read -sp "Enter new password: " passone;
printf '\n'
read -sp "Repeat password: " passtwo;

if [ $passone = $passtwo ];
then
	touch /data/data/com.termux/files/usr/share/login/.pass
	python -c "import hashlib; print(hashlib.sha1(b'$passone').hexdigest())" > /data/data/com.termux/files/usr/share/login/.pass
	printf '\n'
	echo 'Login installed'

elif [ $passone != $passtwo ];
then
	echo 'Password dont match'
	printf '\n'
fi
