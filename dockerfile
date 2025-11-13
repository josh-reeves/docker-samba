FROM ubuntu:latest
ARG USERS
VOLUME /etc/samba
EXPOSE 137-139/tcp 137-139/udp 445/tcp 445/udp
RUN apt update -y
RUN apt upgrade -y
RUN for USER in $USERS; \
	do useradd -m ${USER} --home /home/${USER}; \
	done;
RUN apt install samba -y
RUN touch /var/log/samba/samba.log
CMD truncate -s 0 /var/log/samba/samba.log \
    && service smbd start \
    && service nmbd start \
    && tail -F /var/log/samba/samba.log
