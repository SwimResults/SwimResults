# Local-dev image for any SwimResults Go service, built from the local checkout (build context = ../server/<svc>).
# The production Dockerfiles in each repo copy a binary pre-built by CI, so they can't build from source.
FROM golang:1.24-alpine
RUN apk add --no-cache qpdf tzdata
ENV TZ=Europe/Berlin
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o /app/service . && mkdir -p /app/logs
EXPOSE 8080
CMD ["/app/service"]
