FROM ubuntu:18.04


RUN apt-get update

RUN apt-get install -y python3 python3-pip ffmpeg postgresql-client dos2unix
RUN useradd --home /opt/zou zou &&\
    mkdir /opt/zou &&\
    chown zou: /opt/zou &&\
    mkdir /opt/zou/backups &&\
    chown zou: /opt/zou/backups

WORKDIR /opt/zou

RUN pip3 install virtualenv &&\
    virtualenv zouenv &&\
    . zouenv/bin/activate &&\
    zouenv/bin/pip3 install zou &&\
    zouenv/bin/pip3 install boto3

RUN mkdir /opt/zou/previews &&\
    mkdir /opt/zou/tmp &&\
    mkdir /opt/zou/logs &&\
    mkdir /etc/zou

ADD ./gunicorn.conf.py /etc/zou
ADD ./gunicorn-events.conf.py /etc/zou

ADD ./zou_entrypoint.sh .
RUN dos2unix ./zou_entrypoint.sh
RUN chmod u+x ./zou_entrypoint.sh

ADD ./first_run.sh .
RUN dos2unix ./first_run.sh
RUN chmod u+x ./first_run.sh

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENTRYPOINT [ "./zou_entrypoint.sh" ]
