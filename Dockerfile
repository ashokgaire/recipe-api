# lightweight python tag
FROM python:3.8-alpine
MAINTAINER oxy

#run python in unbuffered mode
ENV PYTHONUNBUFFER 1

COPY ./requirement.txt /requirement.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
     gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirement.txt
RUN apk del .tmp-build-deps

#RUN rm -rf  /app
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#for security purpose
RUN adduser -D user
USER user

