FROM alpine

ENV SSH_PRIVATEKEY ""
ENV SSH_SERVER "127.0.0.1"
ENV SSH_PORT "22"
ENV SSH_USER "prox"
ENV SSH_LOCAL_PORT "9050"

# Install openssh client
RUN apk add -U openssh

# Copy the init script and make it executable
COPY init /usr/local/sbin/init
RUN chmod +x /usr/local/sbin/init

# Switch user
USER nobody

# Run the init script
CMD ["/usr/local/sbin/init"]
