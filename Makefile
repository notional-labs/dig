APP_NAME = dig
DAEMON_NAME = digd
LEDGER_ENABLED ?= true

PACKAGES=$(shell go list ./... | grep -v '/simulation')
VERSION := $(shell echo $(shell git describe --tags --always) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')
COSMOS_SDK := $(shell grep -i cosmos-sdk go.mod | awk '{print $$2}')

build_tags = netgo
ifeq ($(LEDGER_ENABLED),true)
  ifeq ($(OS),Windows_NT)
    GCCEXE = $(shell where gcc.exe 2> NUL)
    ifeq ($(GCCEXE),)
      $(error gcc.exe not installed for ledger support, please install or set LEDGER_ENABLED=false)
    else
      build_tags+=ledger
    endif
  else
    UNAME_S = $(shell uname -s)
    ifeq ($(UNAME_S),OpenBSD)
      $(warning OpenBSD detected, disabling ledger support (https://github.com/cosmos/cosmos-sdk/issues/1988))
    else
      GCC = $(shell command -v gcc 2> /dev/null)
      ifeq ($(GCC),)
        $(error gcc not installed for ledger support, please install or set LEDGER_ENABLED=false)
      else
        build_tags+=ledger
      endif
    endif
  endif
endif
build_tags := $(strip $(build_tags))

whitespace :=
whitespace += $(whitespace)
comma := ,
build_tags_comma_sep := $(subst $(whitespace),$(comma),$(build_tags))

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=${APP_NAME} \
	-X github.com/cosmos/cosmos-sdk/version.AppName=${DAEMON_NAME} \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT) \
	-X "github.com/cosmos/cosmos-sdk/version.BuildTags=$(build_tags_comma_sep),cosmos-sdk $(COSMOS_SDK)"

BUILD_FLAGS := -tags "$(build_tags)" -ldflags '$(ldflags)'

all: go.sum install

install: go.sum
		go install $(BUILD_FLAGS) ./cmd/digd/
build:
		go build $(BUILD_FLAGS) -o ${GOPATH}/bin/${DAEMON_NAME} ./cmd/digd/

go.sum: go.mod
		@echo "--> Ensure dependencies have not been modified"
		GO111MODULE=on go mod verify

lint:
	@echo "--> Running linter"
	@golangci-lint run
	@go mod verify



###############################################################################
###                           Tests & Simulation                            ###
###############################################################################

include sims.mk

test: test-unit test-build

test-all: check test-race test-cover

test-unit:
	@VERSION=$(VERSION) go test -mod=readonly -tags='ledger test_ledger_mock' ./...

test-race:
	@VERSION=$(VERSION) go test -mod=readonly -race -tags='ledger test_ledger_mock' ./...

test-cover:
	@go test -mod=readonly -timeout 30m -race -coverprofile=coverage.txt -covermode=atomic -tags='ledger test_ledger_mock' ./...

benchmark:
	@go test -mod=readonly -bench=. ./...


###
# Find OS and Go environment
# GO contains the Go binary
# FS contains the OS file separator
###
ifeq ($(OS),Windows_NT)
  GO := $(shell where go.exe 2> NUL)
  FS := \\
else
  GO := $(shell command -v go 2> /dev/null)
  FS := /
endif

ifeq ($(GO),)
  $(error could not find go. Is it in PATH? $(GO))
endif

GOPATH ?= $(shell $(GO) env GOPATH)
GITHUBDIR := $(GOPATH)$(FS)src$(FS)github.com

###
# Functions
###

go_get = $(if $(findstring Windows_NT,$(OS)),\
IF NOT EXIST $(GITHUBDIR)$(FS)$(1)$(FS) ( mkdir $(GITHUBDIR)$(FS)$(1) ) else (cd .) &\
IF NOT EXIST $(GITHUBDIR)$(FS)$(1)$(FS)$(2)$(FS) ( cd $(GITHUBDIR)$(FS)$(1) && git clone https://github.com/$(1)/$(2) ) else (cd .) &\
,\
mkdir -p $(GITHUBDIR)$(FS)$(1) &&\
(test ! -d $(GITHUBDIR)$(FS)$(1)$(FS)$(2) && cd $(GITHUBDIR)$(FS)$(1) && git clone https://github.com/$(1)/$(2)) || true &&\
)\
cd $(GITHUBDIR)$(FS)$(1)$(FS)$(2) && git fetch origin && git checkout -q $(3)

go_install = $(call go_get,$(1),$(2),$(3)) && cd $(GITHUBDIR)$(FS)$(1)$(FS)$(2) && $(GO) install

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(shell cd $(shell dirname $(mkfile_path)); pwd)

###############################################################################
###                                 Tools                                   ###
###############################################################################

BIN ?= /usr/local/bin
UNAME_S ?= $(shell uname -s)
UNAME_M ?= $(shell uname -m)

TOOLS_DESTDIR  ?= $(GOPATH)/bin
RUNSIM         = $(TOOLS_DESTDIR)/runsim

BUF_VERSION ?= 0.7.0
PROTOC_VERSION ?= 3.11.2

ifeq ($(UNAME_S),Linux)
  PROTOC_ZIP ?= protoc-3.11.2-linux-x86_64.zip
endif
ifeq ($(UNAME_S),Darwin)
  PROTOC_ZIP ?= protoc-3.11.2-osx-x86_64.zip
endif

all: tools

tools: tools-stamp

tools-stamp: $(RUNSIM)
	touch $@

# Install the runsim binary with a temporary workaround of entering an outside
# directory as the "go get" command ignores the -mod option and will polute the
# go.{mod, sum} files.
#
# ref: https://github.com/golang/go/issues/30515
runsim: $(RUNSIM)
$(RUNSIM):
	@echo "Installing runsim..."
	@(cd /tmp && go install github.com/cosmos/tools/cmd/runsim@v1.0.0)

protoc:
	@echo "Installing protoc compiler..."
	@(cd /tmp; \
	curl -sSOL "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/${PROTOC_ZIP}"; \
	unzip -o ${PROTOC_ZIP} -d /usr/local bin/protoc; \
	unzip -o ${PROTOC_ZIP} -d /usr/local 'include/*'; \
	rm -f ${PROTOC_ZIP})

protoc-gen-gocosmos:
	@echo "Installing protoc-gen-gocosmos..."
	@go install github.com/regen-network/cosmos-proto/protoc-gen-gocosmos

buf: protoc-gen-buf-check-breaking protoc-gen-buf-check-lint
	@echo "Installing buf..."
	@(cd /tmp; \
	curl -sSOL "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-${UNAME_S}-${UNAME_M}"; \
	mv buf-${UNAME_S}-${UNAME_M} "${BIN}/buf"; \
	chmod +x "${BIN}/buf")

protoc-gen-buf-check-breaking:
	@echo "Installing protoc-gen-buf-check-breaking..."
	@(cd /tmp; \
	curl -sSOL "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/protoc-gen-buf-check-breaking-${UNAME_S}-${UNAME_M}"; \
	mv protoc-gen-buf-check-breaking-${UNAME_S}-${UNAME_M} "${BIN}/protoc-gen-buf-check-breaking"; \
	chmod +x "${BIN}/protoc-gen-buf-check-breaking")

protoc-gen-buf-check-lint:
	@echo "Installing protoc-gen-buf-check-lint..."
	@(cd /tmp; \
	curl -sSOL "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/protoc-gen-buf-check-lint-${UNAME_S}-${UNAME_M}"; \
	mv protoc-gen-buf-check-lint-${UNAME_S}-${UNAME_M} "${BIN}/protoc-gen-buf-check-lint"; \
	chmod +x "${BIN}/protoc-gen-buf-check-lint")

tools-clean:
	rm -f $(RUNSIM)
	rm -f tools-stamp

.PHONY: all tools tools-clean protoc buf protoc-gen-buf-check-breaking protoc-gen-buf-check-lint protoc-gen-gocosmos