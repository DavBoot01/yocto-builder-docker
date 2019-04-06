
# yocto-builder-docker


Docker image to build a Yocto Linux project on an arbitrary develioment workstation.

Is focused on building NXP Yocto layer at version <strong>L4.14.78_1.0.0</strong>.
So it starts from <strong>Ubuntu 16.04</strong>


## To compile it

    docker build -t alienmind85/yocto-builder:L4.14.78 .


## To run it

    docker run -it --rm -v $(pwd):$(pwd) -w $(pwd) -e USER_NAME=$(whoami) alienmind85/yocto-builder:L4.14.78 bash




### Based on

- https://github.com/steho/yocto-docker
- https://github.com/bstubert/cuteradio