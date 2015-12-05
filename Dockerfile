FROM ubuntu:15.10
MAINTAINER Matias M. Montenegro

# Install supervisor
RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    curl \
    libffi-dev \
    libmysqlclient-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python \
    python-dev \
    python-pip \
    python-setuptools

RUN mkdir /etc/supervisord \
&& mkdir /etc/supervisord/conf.d \
&& mkdir /var/log/supervisord

RUN curl -L -s \
    https://github.com/Supervisor/supervisor/archive/3.2-branch.tar.gz \
    | tar xz -C /usr/local/src \
&& (cd /usr/local/src/supervisor-3.2-branch/ && python setup.py -q install)

COPY supervisord.conf /etc/supervisord/

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

CMD ["/usr/local/bin/supervisord", "-c", "/etc/supervisord/supervisord.conf"]
