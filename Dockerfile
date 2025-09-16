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
RUN adduser -S billgates -G users -u 1027 \
&& chown -R billgates:users /app /music /config

WORKDIR /app
USER billgates
RUN poetry install

CMD ["sh", "-c", "/streamrip.sh"]
