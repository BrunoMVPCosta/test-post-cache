#!/bin/bash -ex

curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt"}' localhost:80/search/
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt"}' localhost:80/search/
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt"}' localhost:80/search/
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt1"}' localhost:80/search/
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt2"}' localhost:80/search/

curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt2"}' localhost:80/search/no/cache
curl -i -X POST -H "Content-type: application/json" --data '{"name": "xpt2"}' localhost:80/search/no/cache


curl -i -X GET -H "Content-type: application/json" localhost:80/
curl -i -X GET -H "Content-type: application/json" localhost:80/

