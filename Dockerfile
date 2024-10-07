FROM busybox:1.37
ENV PORT=8000
LABEL maintainer="Original Author: Chris <c@crccheck.com>, Forked by: martinbacon"

ADD index.html /www/index.html

# EXPOSE $PORT

HEALTHCHECK CMD nc -z localhost $PORT

# Create a basic webserver and run it until the container is stopped
CMD echo "httpd started" && trap "exit 0;" TERM INT; httpd -v -p $PORT -h /www -f & wait
