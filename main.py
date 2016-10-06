# -*- coding: utf-8 -*-
import os

from bottle import route, run, request
from natto import MeCab


def tagger():
    dictdir = os.environ.get('DICT_DIR')
    if dictdir:
        return MeCab('-d {}'.format(dictdir))
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

run(host='0.0.0.0', port=80, reloader=True)
