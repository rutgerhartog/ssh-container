FROM alpine

# Install software
RUN apk add -U openssh-server

# Make the necessary files
RUN mkdir -p /run/sshd
COPY init /usr/sbin/local/init
RUN chmod +x /usr/sbin/local/init

# Add a user
RUN adduser -D prox && passwd -u prox && mkdir -p /home/prox/.ssh
EXPOSE 22

# Create necessary directories
RUN mkdir -p /container/keys /container/config /container/logs /container/pubkeys \
  && chmod 777 /container/logs

# Run the init script, which starts the SSH daemon and reads the log file.
CMD ["/usr/sbin/local/init"]
