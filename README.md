CS3015 Operating systems 
=======================

This repository contains an skeleton for the PintOS project.

## Author

- name lastname ([email](email))

## Project Setup

**Requirements:**
- [Docker](https://docs.docker.com/get-docker/)

### Quick setup

Just execute the `build.sh` bash script to create your docker image, your container and attach it to a volume. In this way every change you did inside the containers will be replicated to your local folder.

```
foo@bar:~$bash build.sh
```

###  Step by step

If you want to execute the bash scripts commands by yourself, you can execute the following commands:

> Don't forget to run the following commands in the same folder as the Dockerfile

- Create the PintOS image

```console
foo@bar:~$ docker build -t <pintos-image-name> .
```

- Create a docker volume to made your changes persistent

```console
foo@bar:~$ docker create -it --volume $(pwd)/pintos/src:/pintos/src --name <my-volume-name> <pintos-image>
```

## Run the container

To start working on your container, you need to run just the `exec.sh` bash script or the following commands:

> Don't forget to replace <my-volume-name> with your volume name

```console
foo@bar:~$ docker start <my-volume-name>
foo@bar:~$ docker exec -it <my-volume-name> bash
```

Inside your container, locate the project **threads** and then execute `make`. 

```console
container:/pintos/src$ cd threads/
container:/pintos/src/threads$ make
```

To test if your build was correctly, run the following command and you must see the following output:

```console
container:/pintos/src/threads$ pintos -q run alarm-multiple
...
(alarm-multiple) end
Execution of 'alarm-multiple' complete.
Timer: 587 ticks
Thread: 0 idle ticks, 587 kernel ticks, 0 user ticks
Console: 2954 characters output
Keyboard: 0 keys pressed
Powering off..
```


## References

- [Pintos documentation](https://www.scs.stanford.edu/21wi-cs140/pintos/pintos.html#SEC_Top)
- [For the dockerfile](https://github.com/JohnStarich/docker-pintos)
- [For the .gitignore](https://github.com/Berkeley-CS162/group0/blob/master/.gitignore)

