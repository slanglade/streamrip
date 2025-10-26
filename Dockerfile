FROM alpine:latest

# Install python3 + pip, system-wide
RUN apk update \
&& apk upgrade \
&& apk add py3-pip \
&& apk cache clean \
&& mkdir /music /config /app \
&& pip install poetry --break-system-packages

COPY poetry.lock pyproject.toml README.md requirements.txt requirements-dev.txt /app/
COPY streamrip/ /app/streamrip/
COPY shell/streamrip.sh ./
RUN chmod +x streamrip.sh
WORKDIR /app

# Create a group and user
RUN adduser -S Amadeus -G users -u 1029 \
&& chown -R Amadeus:users /app /music /config

WORKDIR /app
USER Amadeus
RUN poetry install

ENTRYPOINT ["sh", "-c"]
CMD ["/streamrip.sh"]
