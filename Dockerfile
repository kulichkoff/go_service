FROM golang:1.21 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod tidy

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o service ./cmd/service


FROM alpine:latest

COPY --from=builder /app/service /service

WORKDIR /

EXPOSE 8080

CMD ["/service"]
