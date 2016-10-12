# -*- coding: utf-8 -*-
import os

from bottle import route, request, default_app
from natto import MeCab


def tagger():
    dicdir = os.environ.get('MECAB_DICDIR')
    if dicdir:
        return MeCab('-d {}'.format(dicdir))
    else:
        return MeCab()


@route('/parse')
def index():
    result = []
    for line in tagger().parse(request.query.q).split('\n'):
        line = line.strip()
        if line == 'EOS':
            break
        surface, features = line.split('\t')
        result.append({
            'surface': surface,
            'features': features.split(',')
        })
    return {
        'result': result
    }

app = default_app()
