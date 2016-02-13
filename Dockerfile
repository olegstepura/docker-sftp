FROM debian:jessie

ARG WWW_PASSWORD
ARG WWW_USER

ENV DATA_DIR=/srv/www \
# new UID to be assigned to www-data user
WWW_DATA_UID=999 \
# UID that is actually assigned to www-user
WWW_USER_UID=33

# Install OpenSSH
RUN export DEBIAN_FRONTEND=noninteractive && \
	(if [ -z "$WWW_USER" -o -z "$WWW_PASSWORD" ]; then >&2 echo "\n\nNo WWW_USER or WWW_PASSWORD provided!\nProvide it using docker build --build-arg WWW_PASSWORD=123456 --build-arg WWW_USER=test\n\n"; exit 1; fi) && \
	#>&2 echo "\n\nWWW_PASSWORD: '$WWW_PASSWORD'\nWWW_USER: '$WWW_USER'\n\n" && \
	apt-get update && \
    apt-get -y install \
		openssh-server \
		openssh-sftp-server && \

	# sshd needs this directory to run
	mkdir -p /var/run/sshd && \
	usermod --uid $WWW_DATA_UID www-data && \
	groupmod --gid $WWW_DATA_UID www-data && \
	groupadd --gid $WWW_USER_UID $WWW_USER && \
	useradd --shell /bin/bash --home $DATA_DIR --uid $WWW_USER_UID --gid $WWW_USER_UID $WWW_USER && \
	echo "$WWW_USER:$WWW_PASSWORD" | chpasswd && \
	
	apt-get clean -qq && \
  	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy configuration
COPY image-files/ /

EXPOSE 22

ENTRYPOINT ["/sftp-init.sh"]
