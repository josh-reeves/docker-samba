FROM alpine:latest
ARG USERS
RUN apk update \
	&& apk upgrade --no-cache
RUN apk add --no-cache samba
RUN apk add --no-cache openrc
RUN rc-update add samba
RUN rc-service samba start --ifinactive
RUN for USER in $USERS; \
	do adduser -h /home/${USER} -D ${USER}; \
	done;
RUN touch /var/log/samba/samba.log
CMD truncate -s 0 /var/log/samba/samba.log && tail -F /var/log/samba/samba.log