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
	cscope

# Fix the qemu path
RUN ln -s /bin/qemu-system-i386 /bin/qemu

# Clean up apt-get's files
RUN apt-get clean autoclean && \
    rm -rf /var/lib/apt/* /var/lib/cache/* /var/lib/log/*

# Create working directory
WORKDIR /pintos
COPY ./pintos/src /pintos


# Add Pintos to PATH
ENV PATH=/pintos/utils:$PATH

# Fix ACPI bug
## Fix described here under "Troubleshooting": http://arpith.xyz/2016/01/getting-started-with-pintos/
RUN sed -i '/serial_flush ();/a \
  outw( 0x604, 0x0 | 0x2000 );' /pintos/devices/shutdown.c

# Configure Pintos for QEMU
RUN sed -i 's/bochs/qemu/' /pintos/*/Make.vars
## Compile Pintos kernel
RUN cd /pintos/threads && make
## Reconfigure Pintos to use QEMU
RUN sed -i 's/\/usr\/class\/cs140\/pintos\/pintos\/src/\/pintos/' /pintos/utils/pintos-gdb && \
    sed -i 's/LDFLAGS/LDLIBS/' /pintos/utils/Makefile && \
    sed -i 's/\$sim = "bochs"/$sim = "qemu"/' /pintos/utils/pintos && \
    sed -i 's/kernel.bin/\/pintos\/threads\/build\/kernel.bin/' /pintos/utils/pintos && \
    sed -i "s/my (@cmd) = ('qemu');/my (@cmd) = ('qemu-system-x86_64');/" /pintos/utils/pintos && \
    sed -i 's/loader.bin/\/pintos\/threads\/build\/loader.bin/' /pintos/utils/Pintos.pm

CMD ["sleep", "infinity"]
