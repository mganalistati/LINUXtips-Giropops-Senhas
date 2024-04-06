FROM python:3.10.14-alpine3.19

LABEL MAINTAINER="murillogomes@giropopsapp.senhas" 

WORKDIR /usr/src/app

COPY requirements.txt  ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./ ./

ENV  REDIS_HOST="redis"

EXPOSE 5000/tcp
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
