# Goal

This is a simple POC to demostrate that we can use cache along with POST. The first version only supports Varnish as cache server, but feel free to add other technology to demostrate how it could work using that technology.

# How to use it

```bash
docker-compose build
```

```bash
docker-compose up
```

After everything is running, you can use curl to validate if the cache is working for POST requests.

```bash
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt"}' localhost:80/search/
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt"}' localhost:80/search/
```

You will notice that the header `X-Cache` will have `MISS` in the first request and `HIT` in the second request.
And the Cache-Control is respected as well, if you try and use the endpoint `/search/no/cache`, you will notice that no cache is done.

