CS2S01 Operating systems 
=======================

This repository contains an skeleton for the PintOS project.

## Authors

- name lastname ([email](email))
- name lastname ([email](email))
- name lastname ([email](email))

## Projects

Each PintOS project is in an specific branch.
- Project 1: Threads (branch: [project-1](<link to the branch>))

## Designdocs

The skeletons of the design docs are on the [designdocs](https://github.com/CS2S01-UTEC/pintos-designdocs) repository.

## Project Setup

**Requirements:**
- [Docker](https://docs.docker.com/get-docker/)

## Quick setup

Just execute the `build.sh` bash script to create your docker image, your container and attach it to a volume. In this way every change you did inside the containers will be replicated to your local folder.

```
foo@bar:~$bash build.sh
```

**Step by step:**

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

To test if you setup is correctly builded, inside the container run the following command and see the following output:

```console
foo@bar:~$ pintos -q run alarm-multiple
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

