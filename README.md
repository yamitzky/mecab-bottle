# mecab-bottle
MeCab API on Docker

## Usage

Start server

```
docker run --rm -p 8080:80 yamitzky/mecab-bottle
```

Then `GET /parse` with `q` param

```
curl "http://localhost:8080/parse?q=山田くんと７人の魔女"
```

