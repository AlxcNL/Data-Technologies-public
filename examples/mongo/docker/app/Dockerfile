FROM faucet/python3:12.0.5

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories \
    && apk update \    
    && apk add bash curl mongodb mongodb-tools

EXPOSE 5000

WORKDIR /app
COPY templates templates

ADD requirements.txt .
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

ADD app.py .

USER 1001

ENTRYPOINT [ "python" ]
CMD [ "/app/app.py"]
# CMD [ "/app/app.py" ]
