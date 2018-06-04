FROM python:3.6-slim

RUN apt-get update -y --fix-missing && \
      apt-get install -y --no-install-recommends \
      mecab \
      libmecab-dev \
      mecab-ipadic-utf8 \
      git \
      make \
      curl \
      xz-utils \
      file \
      patch

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git /tmp/neologd && \
  cd /tmp/neologd && \
  ./bin/install-mecab-ipadic-neologd -n -u -y && \
  rm -rf /tmp/neologd

WORKDIR /usr/src/app

RUN pip install \
      natto-py \
      bottle \
      gunicorn

RUN apt-get remove --purge --auto-remove -y \
      git \
      make \
      curl \
      xz-utils \
      file \
      patch && \
      rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app

ENV MECAB_DICDIR=/usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd

EXPOSE 80
CMD [ "python", "-m", "bottle", "-b", "0.0.0.0:80", "main" ]
