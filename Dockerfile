FROM alpine

# Install software
RUN apk add -U openssh-server

# Make the necessary files
RUN mkdir -p /run/sshd
RUN touch /tmp/ssh.log && chmod 777 /tmp/ssh.log
COPY init /usr/sbin/local/init
RUN chmod +x /usr/sbin/local/init

# Add a user
RUN adduser -D prox
EXPOSE 22



# Run the init script, which starts the SSH daemon and reads the log file.
CMD ["/usr/sbin/local/init"]
