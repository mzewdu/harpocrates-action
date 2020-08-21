FROM python:3.7-alpine

LABEL repository="https://github.com/mzewdu/harpocrates-action"
LABEL homepage="https://github.com/actions"


LABEL name="harpocrates-scan"
LABEL version="1.4.2"
LABEL maintainer="mzewdu"

LABEL "com.github.actions.name"="Harpocrates Scan"
LABEL "com.github.actions.description"="Scan repository for secrets"
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="red"

RUN apk add --no-cache git less
RUN pip install gitdb2==3.0.0 truffleHog==2.1.11

RUN apk --update add git less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY regexes.json /regexes.json

ENTRYPOINT ["sh", "/entrypoint.sh"]
