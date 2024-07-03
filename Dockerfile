FROM golang:latest

RUN set -eux; \
    export GOROOT="$(go env GOROOT)"; \
    ./run-tool-which-requires-GOROOT-set.sh

WORKDIR /app

COPY . /app

RUN go mod init main
RUN go mod tidy
RUN go build -o main .

CMD ["./main"]


# stop all
# docker stop $(docker ps -a -q)
# remove all
# docker rm $(docker ps -qa)

# remove all unused
# docker container prune

# remove all images
# docker rmi $(docker images -q)

# docker build . -t go-app
# docker run --name=go-web-app -p 80:8080 go-app

# $ docker run --rm golang:1.9 go env GOROOT /usr/local/go