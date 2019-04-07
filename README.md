
# yocto-builder-docker


Docker image to build a Yocto Linux project on an arbitrary develioment workstation.

Is focused on building NXP Yocto layer at version <strong>L4.14.78_1.0.0</strong>.
So it starts from <strong>Ubuntu 16.04</strong>.

<br>

## To compile it

    docker build -t alienmind85/yocto-builder:L4.14.78 .

<br>

## Parameters

- <strong>USER_NANE</strong>: name of the user to create (into code below we use the same user whach are running the image);
- <strong>USER_CMD</strong>: relative path of the script or binary file to launch at user login.<br>
***Attemption***: the system assumes as root folder the one where the user launches the container and the script/binary file must to be in that folder or in a his subfolder. 

<br>

## Run mode

- <strong>handless</strong>: execute a single task passed as argument (a script or binary file);
- <strong>interactive</strong>: the user can use commands from shell


### To run it in handless mode

    docker run -it --rm -v $(pwd):$(pwd) -v /dev:/dev -v /proc:/proc -v /sys:/sys -w $(pwd) -e USER_NAME=$(whoami) -e USER_CMD=<script/binary> alienmind85/yocto-builder:L4.14.78 bash

### To run it in iteractive mode

    docker run -it --rm -v $(pwd):$(pwd) -v /dev:/dev -v /proc:/proc -v /sys:/sys -w $(pwd) -e USER_NAME=$(whoami) alienmind85/yocto-builder:L4.14.78 bash


<br>

## Credits

Davide Cardillo, alias ***AlienMind*** <br>
Github name: *alienmind85* <br>
mail: <cardillo.davide85@gmail.com>

<br>

## Based on

- https://github.com/steho/yocto-docker
- https://github.com/bstubert/cuteradio