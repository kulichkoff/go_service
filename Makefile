GO ?= go
APP_NAME := service
VERSION := $(shell git describe --tags --always)

build:
	$(GO) build -o $(APP_NAME) ./cmd/$(APP_NAME)

test:
	$(GO) test ./...

run:
	./$(APP_NAME)

docker-build:
	docker build -t $(APP_NAME):$(VERSION) .

docker-run:
	docker run --rm -p 8080:8080 $(APP_NAME):$(VERSION)

clean:
	rm -f $(APP_NAME)

help:
	@echo "Makefile for $(APP_NAME)"
	@echo ""
	@echo "Commands:"
	@echo "  build         - Build binary file"
	@echo "  test          - Run tests"
	@echo "  run           - Run app in dev mode"
	@echo "  docker-build  - Build Docker-image"
	@echo "  docker-run    - Run Docker-container"
	@echo "  clean         - Clean up artifacts"
	@echo "  help          - Show this message"

