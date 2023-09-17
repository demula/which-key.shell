// Copyright 2023 Jesus de Mula Cano
//
// All rights reserved.

//go:build tools
// +build tools

// This package imports things required by build scripts, to force `go mod` to see them as dependencies
package tools

import (
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
	_ "golang.org/x/tools/cmd/goimports"
	_ "gotest.tools/gotestsum"
	_ "mvdan.cc/gofumpt"
)
