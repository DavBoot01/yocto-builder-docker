

#!/bin/bash

echo -----------------------------------------
echo "Set current user: $USER_NAME"
echo -----------------------------------------

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

UCMD=""

echo -----------------------------------------
if [[ -e $USER_CMD ]]; then
	if [[ -x $USER_CMD  ]]; then
		echo Use in handless mode
		echo run user command file: $USER_CMD
		UCMD=$USER_CMD
	else
		echo Use in interactive mode
	fi
else
	echo Use in interactive mode
fi

echo -----------------------------------------
echo

# Login as newest user (not as root) and perfom the single task
su - $USER_NAME $UCMD

exit 0

