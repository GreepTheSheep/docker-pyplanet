FROM python:3.8-bullseye
ENV IS_DOCKER 1

RUN apt-get update
RUN apt-get install -y python3-pip

WORKDIR /server/controller

RUN pip install pyplanet --upgrade
RUN pyplanet init_project pyp

COPY ./base.py /server/controller/pyp/settings/base.py

CMD python /server/controller/pyp/manage.py start