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




# docker system prune -f : to remove all the stopped containers (docker do not touch the running containers)

# docker system prune -a : to remove all the stopped containers (docker do not touch the running containers) + unused images

# docker rm <container_id> : remove a specific container, it should be stopped before (docker stop <container_id>)


############################
#FROM golang:1.9.3 as build-env
#
## allows app_env to be set during build (defaults to empty string)
#ARG app_env
## sets an environment variable to app_env argument, this way the variable     will persist in the container for use in code
#ENV APP_ENV $app_env
#
#COPY ./ /go/src/github.com/Name/ProjectName/
#
#WORKDIR /go/src/github.com/Name/ProjectName/app
#
## install all dependencies
#RUN go get ./...
#
## build the binary
#RUN go build -o /my_app
#
## final stage
#FROM scratch
#
#COPY --from=build-env /my_app /
#
## Put back once we have an application
#CMD ["/my_app"]
#
#EXPOSE 8080
