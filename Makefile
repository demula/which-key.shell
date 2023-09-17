
.PHONY: build
build: ## Run go build.
	go build ./...

.PHONY: test
test: ## Run all go tests.
	go run gotest.tools/gotestsum --hide-summary=skipped -- ./...

.PHONY: lint
lint: gofmt golangcilint ## Run all go linters.

.PHONY: help
help: ## Show help message.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n\n\033[36m\033[0m"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-$(HELP_COLUMN_SIZE)s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

gofmt:
	@echo gofmt -s -w ALL_FILES
	@gofmt -s -w $(shell find . -name '*.go')
	@echo gofumpt -l -w ALL_FILES
	@go run mvdan.cc/gofumpt -l -w .
	@echo goimports -s -w ALL_FILES
	@go run golang.org/x/tools/cmd/goimports -l -w .

golangcilint:
	@echo golangci-lint run --timeout 3m0s
	@go run github.com/golangci/golangci-lint/cmd/golangci-lint run --timeout 3m0s