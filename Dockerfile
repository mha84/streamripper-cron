FROM arm32v7/debian

RUN apt-get update && \
    apt-get install -y --no-install-recommends streamripper cron && \
    rm -rf /var/lib/apt/lists/*
	
ENV CRON1="59 4 * * *"
ENV CRON2="59 15 * * *"
ENV DIR=/streamripper
ENV OPTIONS="http://bob.hoerradar.de/radiobob-live-mp3-hq?sABC=59q6769n\%230%23n4so02848rn3pr5p87363q1pr58r26ro\%23zrqvncynlre -s -a -A -l 2700"

RUN useradd -m -d /home/streamripper streamripper

VOLUME ["/streamripper"]

ADD entrypoint.sh /entrypoint.sh
ADD ripstream.sh /ripstream.sh

ENTRYPOINT ["/entrypoint.sh"]