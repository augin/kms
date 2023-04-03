#!/bin/sh

# $FreeBSD$
#
# PROVIDE: kms 
# REQUIRE: NETWORK
# KEYWORD: shutdown

# add the following line to /etc/rc.conf to enable the kms:
# kms_enable="YES"
. /etc/rc.subr

location="/usr/local/py-kms"
name="kms"
rcvar="kms_enable"

: ${kms_enable:="YES"}

base_path="/usr/local/py-kms"

listen="0.0.0.0"
port="1688"
logfile="/var/log/${name}.log"
log_level="INFO"
pidfile="/var/run/kms.pid"
python="/usr/local/bin/python3.8"
script_py="/usr/local/py-kms/pykms_Server.py"
command="/usr/sbin/daemon"
procname="daemon"
command_args=" -c -P ${pidfile} ${python} ${script_py} ${listen} ${port} -V ${log_level} -F ${logfile} --logsize 100"


load_rc_config $name
run_rc_command "$1"