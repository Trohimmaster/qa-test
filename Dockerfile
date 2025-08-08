FROM quay.io/projectquay/golang:1.22 AS builder

ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG COMMIT
ARG BUILD_DATE

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} \
    go build \
    -ldflags "-X main.Version=${VERSION} -X main.Commit=${COMMIT} -X main.BuildDate=${BUILD_DATE}" \
    -o demo ./cmd/app

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/demo .

ENTRYPOINT ["./demo"]

