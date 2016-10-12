FROM yamitzky/miniconda-neologd:miniconda3

WORKDIR /usr/src/app

RUN pip install \
      bottle \
      gunicorn

COPY . /usr/src/app

ENV MECAB_DICDIR=/usr/lib/mecab/dic/mecab-ipadic-neologd

CMD [ "python", "-m", "bottle", "-b", "0.0.0.0:80", "main" ]
