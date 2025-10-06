APP_NAME := daggo
PKG := ./cmd/server
BUILD_DIR := build
VERSION ?= $(shell git describe --tags --always --dirty)
COMMIT  ?= $(shell git rev-parse --short HEAD)
DATE    ?= $(shell date -u +%Y-%m-%dT%H:%M:%SZ)

DOCKER_IMAGE := daggo:latest

.PHONY: all build run clean test docker-build docker-run

# Default: build the binary
all: build

## Build binary locally
build:
	@echo ">> Building $(APP_NAME)"
	@mkdir -p $(BUILD_DIR)
	CGO_ENABLED=0 go build -trimpath -ldflags="-s -w \
		-X 'main.version=$(VERSION)' \
		-X 'main.commit=$(COMMIT)' \
		-X 'main.date=$(DATE)'" \
		-o $(BUILD_DIR)/$(APP_NAME) $(PKG)

## Run the app locally
run: build
	@echo ">> Running $(APP_NAME)"
	./$(BUILD_DIR)/$(APP_NAME)

## Run tests
test:
	@echo ">> Running tests"
	go test ./... -v

## Clean up build artifacts
clean:
	@echo ">> Cleaning"
	rm -rf $(BUILD_DIR)

## Build Docker image
docker-build:
	@echo ">> Building Docker image: $(DOCKER_IMAGE)"
	DOCKER_BUILDKIT=1 docker build \
		--tag $(DOCKER_IMAGE) \
		--build-arg VERSION="$(VERSION)" \
		--build-arg VCS_REF="$(COMMIT)" \
		--build-arg BUILD_DATE="$(DATE)" \
		.

## Run Docker container
docker-run:
	@echo ">> Running container from $(DOCKER_IMAGE)"
	docker run --rm -p 8080:8080 --name $(APP_NAME) $(DOCKER_IMAGE)
