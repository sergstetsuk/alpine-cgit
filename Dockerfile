FROM alpine:latest

# Install OpenSSH server and Gitolite
# Unlock the automatically-created git user
RUN set -x \
 && apk add --no-cache lighttpd cgit

COPY conf/lighttpd/cgit.conf /etc/lighttpd/cgit.conf
RUN echo 'include "cgit.conf"' >> /etc/lighttpd/lighttpd.conf

COPY conf/cgitrc /etc/cgitrc

# Volume used to store all Gitolite data (keys, config and repositories), initialized on first run
VOLUME /var/lib/git

# Expose port 80 and 443 to access cgit
EXPOSE 80 443

# Default command is to run the lighttpd server with cgit
CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
