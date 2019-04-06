

#!/bin/bash

echo "----------------"
echo "Set current user"
echo "----------------"

USER_ID=$(stat -c '%u' .)
GROUP_ID=$(stat -c '%g' .)

# Save current directory. It is working one.
WD=$(pwd)

groupadd -g $GROUP_ID $USER_NAME
#if [ -e /home/$USER_NAME ]; then
if [ -e $WD ]; then
	# Since scope is to have the same host user profile, should be not need
	# to create the user's home directory since is should be already to exist
	useradd -g $GROUP_ID  -d $WD -s /bin/bash -u $USER_ID $USER_NAME
else
	# exception use case
	useradd -g $GROUP_ID  -d $WD -m -s /bin/bash -u $USER_ID $USER_NAME
fi

# Login as newest user (not as root)
su - $USER_NAME


$@

