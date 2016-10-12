FROM yamitzky/miniconda-neologd:miniconda3

WORKDIR /usr/src/app

RUN pip install bottle

COPY . /usr/src/app

ENV MECAB_DICDIR=/usr/lib/mecab/dic/mecab-ipadic-neologd

CMD [ "python", "main.py" ]
