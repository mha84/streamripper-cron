FROM arm32v7/debian

ARG URL="https://downloads.rclone.org/rclone-current-linux-arm.zip"
ENV CRON1="59 4 * * *"
ENV CRON2="59 15 * * *"
ENV SR_DIR=/streamripper
ENV SR_OPTS="http://bob.hoerradar.de/radiobob-live-mp3-hq?sABC=59q6769n\%230%23n4so02848rn3pr5p87363q1pr58r26ro\%23zrqvncynlre -s -a -A -l 2700"
ENV RCLONE_OPTS="--config /rcloneconfig/rclone.conf"
ENV RCLONE_TARGET="onedrive-michael:temp/mp3/"
ENV TZ=Europe/Berlin

RUN apt-get update && \
    apt-get install -y --no-install-recommends streamripper cron wget ca-certificates unzip tzdata && \
    rm -rf /var/lib/apt/lists/*
	
RUN useradd -m -d /home/streamripper streamripper

RUN cd /tmp \
  && wget -q $URL \
  && unzip ./*.zip \
  && rm rclone-current-linux-arm.zip \
  && cd * \
  && mv ./rclone /usr/bin \
  && cd /tmp \
  && rm -r /tmp/rclone*

VOLUME ["/streamripper"]
VOLUME ["/rcloneconfig"]

ADD entrypoint.sh /entrypoint.sh
ADD ripstream.sh /ripstream.sh

ENTRYPOINT ["/entrypoint.sh"]