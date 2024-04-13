FROM python:3.10.14-alpine3.19

LABEL MAINTAINER="murillogomes@giropopsapp.senhas" 
ARG REDIS_HOST="redis"

WORKDIR /usr/src/app

COPY requirements.txt  ./
RUN pip install --no-cache-dir -r requirements.txt

COPY static ./static/
COPY templates ./templates/
COPY app.py ./ 

ENV  REDIS_HOST=${REDIS_HOST}

EXPOSE 5000/tcp
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
