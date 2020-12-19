# lightweight python tag
FROM python:3.8-alpine
MAINTAINER oxy

#run python in unbuffered mode
ENV PYTHONUNBUFFER 1

COPY ./requirement.txt /requirement.txt
RUN pip install -r /requirement.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#for security purpose
RUN adduser -D user
USER user

