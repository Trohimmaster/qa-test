APP_NAME=demo
VERSION?=$(shell git rev-parse --short HEAD)
COMMIT?=$(shell git rev-parse --short HEAD)
BUILD_DATE?=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
IMAGE_TAG=ghcr.io/username/$(APP_NAME):latest
DOCKERFILE=Dockerfile

# Build Linux amd64
linux:
	GOOS=linux GOARCH=amd64 go build -o $(APP_NAME)-linux ./cmd/app

# Build ARM64
arm:
	GOOS=linux GOARCH=arm64 go build -o $(APP_NAME)-arm64 ./cmd/app

# Build macOS amd64
mac:
	GOOS=darwin GOARCH=amd64 go build -o $(APP_NAME)-mac ./cmd/app

# Build Windows amd64
windows:
	GOOS=windows GOARCH=amd64 go build -o $(APP_NAME)-windows.exe ./cmd/app

# Docker image
image:
	DOCKER_BUILDKIT=0 docker build \
		--build-arg TARGETOS=$$(go env GOOS) \
		--build-arg TARGETARCH=$$(go env GOARCH) \
		--build-arg VERSION=$(VERSION) \
		--build-arg COMMIT=$(COMMIT) \
		--build-arg BUILD_DATE=$(BUILD_DATE) \
		-t $(IMAGE_TAG) \
		-f $(DOCKERFILE) .

# Start testing locally
test:
	go test ./...

# Remove artifact and image
clean:
	docker rmi $(IMAGE_TAG) || true
	rm -f $(APP_NAME)-linux $(APP_NAME)-arm64 $(APP_NAME)-mac $(APP_NAME)-windows.exe

