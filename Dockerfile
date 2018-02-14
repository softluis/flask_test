FROM ubuntu:latest

RUN \
    apt-get update \
    && apt-get install -qy \
    python python-setuptools \
    python-dev build-essential \
    python-pip python-mysqldb python-flask

COPY app.py /opt/app.py

EXPOSE 5000

ENTRYPOINT ["python", "/opt/app.py"]
