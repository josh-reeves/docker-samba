FROM ubuntu:plucky
ARG USERS
RUN apt update -y
RUN apt upgrade -y
RUN apt install samba -y
RUN service smbd start && service nmbd start
RUN apt install systemctl -y
RUN systemctl enable smbd && systemctl enable nmbd
RUN for USER in $USERS; \
	do useradd -m ${USER} --home /home/${USER}; \
	done;
RUN touch /var/log/samba/samba.log
CMD truncate -s 0 /var/log/samba/samba.log && tail -F /var/log/samba/samba.log
