# mecab-bottle
MeCab API on Docker

## Usage

Start server

```
docker run --rm -p 8080:80 yamitzky/mecab-bottle
```

Then `GET /parse` with `q` param

```
curl "http://localhost:8080/parse?q=きゃりーぱみゅぱみゅ"
```

By default, [mecab-ipadic-neologd](https://github.com/neologd/mecab-ipadic-neologd) is used as mecab's dictionary. You can use mecab-ipadic-utf8 or your favorite one.

```
docker run --rm -p 8080:80 -e MECAB_DICDIR=/var/lib/mecab/dic/debian yamitzky/mecab-bottle
curl "http://localhost:8080/parse?q=きゃりーぱみゅぱみゅ"
```
