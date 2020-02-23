FROM arm32v7/debian

RUN apt-get update && \
    apt-get install -y --no-install-recommends streamripper cron && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/streamripper streamripper

VOLUME ["/streamripper"]
VOLUME ["/etc/cron.d"]

CMD chmod +x /etc/cron.d/*;/etc/init.d/cron start;tail -f /dev/null