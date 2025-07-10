FROM ubuntu:plucky
ARG USERNAME=user
RUN apt update -y
RUN apt install samba -y
RUN useradd ${USERNAME} --home /home/${USERNAME}
RUN touch /var/log/samba/samba.log
RUN chmod -R 777 /var/log/samba
USER ${USERNAME}
WORKDIR /home/${USERNAME}
CMD truncate -s 0 /var/log/samba/samba.log && tail -F /var/log/samba/samba.log
