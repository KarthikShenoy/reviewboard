FROM python:3.5-buster
MAINTAINER shenoy.karthik@gmail.com

RUN pip install reviewbot-worker

ADD init.sh /init.sh
RUN chmod +x /init.sh
CMD /init.sh