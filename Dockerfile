FROM ubuntu:18.04
MAINTAINER shenoy.karthik@gmail.com


RUN apt update -y && \
        apt install --no-install-recommends -y \
        build-essential python-pip python-dev libffi-dev libssl-dev patch \
        python-setuptools python-wheel python-virtualenv \
        uwsgi uwsgi-plugin-python \
        python-ldap python-svn
RUN pip install --upgrade pip
RUN pip install "django-storages<1.3"
RUN apt install -y apache2 apache2-utils ssl-cert apache2-utils ssl-cert libapache2-mod-wsgi
RUN apt install -y default-libmysqlclient-dev default-mysql-client
RUN pip install mysql-python reviewbot-extension

RUN pip install ReviewBoard

RUN rm -rf /var/lib/apt/lists/*
ADD start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

CMD /start.sh