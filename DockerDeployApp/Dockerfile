FROM ubuntu:18.04
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

EXPOSE 25000
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
CMD [ "python", "./app.py" ]

