FROM faucet/python3:12.0.5

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories \
    && apk update \    
    && apk add bash curl mongodb mongodb-tools

WORKDIR /app

ADD requirements.txt .
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

ADD start_flask.sh .
COPY templates templates

ADD app.py .

USER 1001

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0"]
