FROM alpine:latest
COPY xmastree.sh /xmastree.sh
RUN apk add --update ncurses bash
ENV TERM=xterm-256color
CMD ["bash","/xmastree.sh"]
