default: deps lint test

build: build-cli build-gui

build-gui:
	go build -tags nocli  -o bin/coyim-gui

build-cli:
	go build -o bin/coyim

lint:
	golint ./...

test:
	go test -cover -v ./...

ci: get default

get:
	go get -t ./...

deps:
	go get github.com/golang/lint/golint
	go get golang.org/x/tools/cmd/cover
	go get github.com/twstrike/go-gtk/gdk
	go get github.com/twstrike/go-gtk/gdkpixbuf
	go get github.com/twstrike/go-gtk/glib
	go get github.com/twstrike/go-gtk/gtk
	go get github.com/twstrike/go-gtk/pango
	go get github.com/twstrike/otr3
	go get github.com/twstrike/otr3/sexp
	go get golang.org/x/crypto/ssh/terminal
	go get golang.org/x/net/html
	go get golang.org/x/net/html/atom
	go get golang.org/x/net/proxy

cover:
	go test . -coverprofile=coverage.out
	go tool cover -html=coverage.out
