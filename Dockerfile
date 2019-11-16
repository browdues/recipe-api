FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

# This uses the alpine package manager (apk) to 'add' postgresql-client
# --update means update the registry before we add the package
# --no-cache means it won't story this registry index in our docker file. We do 
# this to create the smallest container footprint possible and also to reduce as many extra 
# dependencies as possible
# --virtual creates an alias for our dependencies so that we can easily remove them later
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
     gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# -D = this user runs applications only
# I.E. The user doesn't have root access
RUN adduser -D user 
USER user

