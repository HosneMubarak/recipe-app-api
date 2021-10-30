FROM python:3.8-alpine
#optional
MAINTAINER Hosne Mubarak

#for running python directly or unbufferly
ENV PYTHONUNBUFFERED 1

#copying req txt to docker
COPY ./requirements.txt /requirements.txt

#intsall req txt from image req txt we have just copied
RUN pip install -r requirements.txt


#creating and app folder into docker image to store our code
RUN mkdir /app
# set default directory
WORKDIR /app
#coping our local code to docker image folder call app
COPY ./app /app

# createing a user nameed "user" for running our docker image
RUN adduser -D user
# switch to ther user
USER user