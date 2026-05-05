FROM faucet/python3:12.0.5

RUN apk update \
    && apk add bash curl

WORKDIR /app

ADD app.py .
ADD requirements.txt .
ADD start_flask.sh .
COPY templates templates

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

USER 1001

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0"]
