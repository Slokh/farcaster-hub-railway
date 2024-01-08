FROM farcasterxyz/hubble:latest

COPY init.sh init.sh

CMD ["/bin/sh", "init.sh"]