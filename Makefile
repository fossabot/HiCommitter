# Copyright 2011 The Go Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

GOOS=windows

all: HiCommitter.exe

HiCommitter.exe:
	go build -o $@ -ldflags '-s -w -H windowsgui'

install:
	go install -ldflags '-s -w -H windowsgui'

clean:
	rm -f HiCommitter.exe

zwinapi.go: winapi.go
	(echo '// +build windows'; \
	$(GOROOT)/src/pkg/syscall/mksyscall_windows.pl $<) \
		| gofmt \
		> $@
