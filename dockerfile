FROM ubuntu:plucky
RUN apt update -y
RUN apt install samba -y
CMD truncate -s 0 /var/log/samba/samba.log && tail -F /var/log/samba/samba.log