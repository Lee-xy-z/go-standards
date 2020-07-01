GO_STANDARDS_PATH=github.com/Lee-xy-z/go-standards
GO_STANDARDS_BINARY_NAME=standards

GOBUILD=go build

GIT_SHA=$(shell git rev-parse HEAD)
GIT_CLOSEST_TAG=$(shell git describe --abbrev=0 --tags)
DATE=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')
BUILD_INFO_IMPORT_PATH=$(GO_STANDARDS_PATH)/pkg/version
BUILD_INFO=-ldflags "-X $(BUILD_INFO_IMPORT_PATH).commitSHA=$(GIT_SHA) -X $(BUILD_INFO_IMPORT_PATH).latestVersion=$(GIT_CLOSEST_TAG) -X $(BUILD_INFO_IMPORT_PATH).date=$(DATE)"


.PYONY: build-standards
build-standards:
	$(GOBUILD) -o $(GO_STANDARDS_BINARY_NAME) $(BUILD_INFO) ./cmd/standards/main.go