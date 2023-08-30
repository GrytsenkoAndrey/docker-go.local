FROM golang:1.16

WORKDIR /app

COPY . .

RUN go mod init main
RUN go mod tidy
RUN go build -o main .

CMD ["./main"]
