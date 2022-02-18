FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt -y upgrade
RUN apt install -y build-essential python libsigsegv2 \
	libxml2-dev mtd-utils genext2fs mkcramfs unzip bc kmod libgtk2.0-0

ADD Ambarella_Toolchain_Linaro_2015.11.zip /tmp
RUN unzip /tmp/Ambarella_Toolchain_Linaro_2015.11.zip -d /tmp

ADD ubuntuToolChain /tmp/Ambarella_Toolchain_Linaro_2015.11
RUN cd /tmp/Ambarella_Toolchain_Linaro_2015.11 && \
	./ubuntuToolChain

ADD gawk_4.1.3+dfsg-0.1_amd64.deb /tmp
RUN dpkg -i /tmp/gawk_4.1.3+dfsg-0.1_amd64.deb
