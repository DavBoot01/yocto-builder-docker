

#!/bin/bash

echo "----------------"
echo "Set current user"
echo "----------------"

USER_ID=$(stat -c '%u' .)
#USER_NAME=$(stat -c '%U' .)
GROUP_ID=$(stat -c '%g' .)

echo --- $USER_NAME
groupadd -g $GROUP_ID $USER_NAME
useradd -g $GROUP_ID  -m -s /bin/bash -u $USER_ID $USER_NAME
su - $USER_NAME
$@

