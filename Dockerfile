FROM golang:1.18-alpine3.16 as builder

WORKDIR /app

COPY /hello .

RUN go build main.go

FROM hello-world:latest

WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["./main"]
