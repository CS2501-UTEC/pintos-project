# Operating system
FROM ubuntu:latest

#Set bash as shell
SHELL ["/bin/bash", "-c"]

# Install set up tools
RUN apt-get update && \
    DEBIAN_FRONTEND=noninterative \
        apt-get install -y --no-install-recommends \
	gdb qemu-system-x86 \
	vim build-essential \
	ctags cgdb \
	cscope clang

# Fix the qemu path
#RUN ln -s /bin/qemu-system-i386 /bin/qemu

# Clean up apt-get's files
RUN apt-get clean autoclean && \
    rm -rf /var/lib/apt/* /var/lib/cache/* /var/lib/log/*


# Create working directory
WORKDIR /pintos
COPY ./pintos/src /pintos

# Add Pintos to PATH
ENV PATH=/pintos/utils:$PATH
