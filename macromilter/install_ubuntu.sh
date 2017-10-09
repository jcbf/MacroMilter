#!/bin/bash
# create files and folders
mkdir /etc/macromilter/
mkdir -p /var/log/macromilter/
# only needed for a chroot env
# mkdir /var/spool/postfix/etc/milter

# install macromilter dependencies
apt-get update
apt-get install python2.7 python2.7-dev libmilter-dev libmilter1.0.1 python-pip

# install oletools
pip install oletools
# install pymilter --> maybe you need some addtional dependencies - see doc
pip install pymilter
# install configparser
pip install configparser

# copy the python script
cd /usr/bin/
wget https://raw.githubusercontent.com/sbidy/MacroMilter/master/macromilter/macromilter.py
cd /etc/macromilter/
wget https://raw.githubusercontent.com/sbidy/MacroMilter/master/macromilter/config.ini
# setup upstart config
cd /etc/init/
wget https://raw.githubusercontent.com/sbidy/MacroMilter/master/macromilter/MacroMilter.conf
initctl reload-configuration

# set chown for postfix
chown postfix:postfix -R /etc/macromilter
chown postfix:postfix -R /var/log/macromilter
<<<<<<< HEAD
chown postfix:postfix /usr/bin/macromilter.py
=======
>>>>>>> 5a746dc9cb6e1f2692087fc51b6d7e6a06bbcca1

# only needed if you run the milter at chroot an with a linux-socket
# chown postfix:postfix -R /var/spool/postfix/etc/milter 

# start and check
service MacroMilter start
tail /var/log/syslog
