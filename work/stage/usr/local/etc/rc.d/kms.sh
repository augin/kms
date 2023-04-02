#!/bin/sh
# This file was automatically generated
# by the pfSense service handler.

rc_start() {
	
echo "Starting KMS Server..."
//usr/local/bin/python3.8 /usr/local/py-kms/pykms_Server.py 0.0.0.0 1688 -V INFO -F /var/log/kms-server.log --logsize 100&

}

rc_stop() {
	echo "Stopping KMS Server..."
/usr/bin/killall zpython3.8
/bin/sleep 5

}

case $1 in
	start)
		rc_start
		;;
	stop)
		rc_stop
		;;
	restart)
		rc_stop
		rc_start
		;;
esac

