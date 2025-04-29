all:

build:
	docker build -t flexo-agent . -f Dockerfile

run:
	docker run -p 8000:8000 --env-file .env flexo-agent

# make test FLEXO_API_KEY=<flexo_api_key>
test:
	cd tests; \
	curl http://localhost:8000/v1/chat/completions -H "Content-Type: application/json" -H "X-API-Key: ${FLEXO_API_KEY}" --data "@hello-ai.json"
