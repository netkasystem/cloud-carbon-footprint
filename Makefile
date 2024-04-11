BUILD_VERSION = 1.0.0
BUILD_DIR = ./packages/api

build:
	yarn install && cd $(BUILD_DIR) && yarn build

build-docker-full: ## Build Docker image for development.
	@echo "build docker container"
	docker build --no-cache -f ./packages/api/Dockerfile.local --tag netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION).$(shell git log -1 --pretty=format:"%h") .

build-docker-official: ## Build Docker image for official.
	@echo "build docker container"
	docker build --no-cache -f ./packages/api/Dockerfile.local --tag netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION) .

publish-nlg-development: ##
	docker push netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION).$(shell git log -1 --pretty=format:"%h")

publish-nlg-official: ##
	docker push netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION)