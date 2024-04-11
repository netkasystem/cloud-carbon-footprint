BUILD_VERSION = 1.0.0
 
BUILD_DIR = ./packages/api
YARN_CMD = yarn
 
build:
    yarn install && cd $(BUILD_DIR) && $(YARN_CMD) build
#   @echo "build cloud-carbon-api"
#   $(GO) build -o ./packages ./bin/nlgsrv-server
 
build-docker-full: ## Build Docker image for development.
    @echo "build docker container"
    docker build --no-cache -f ./packages/api/Dockerfile.local --tag netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION).$(shell git log -1 --pretty=format:"%h") .
    
build-docker-official: ## Build Docker image for development.
    @echo "build docker container"
    docker build --no-cache -f ./packages/api/Dockerfile.local --tag netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION) .
 
publish-nlg-dev: ##
    docker push netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION).$(shell git log -1 --pretty=format:"%h")
 
publish-nlg-official: ##
    docker push netkaofficialhub/nlg-cloud-carbon-api:$(BUILD_VERSION)