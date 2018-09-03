FROM golang:1.11-alpine as builder

WORKDIR /build

RUN apk add --update --no-cache git
RUN go get github.com/2tvenom/go-test-teamcity \
    && cd /build

ARG CACHE_INVALIDATION
COPY . /build
RUN go test -v -coverprofile=coverage.out -covermode=count ./... | go-test-teamcity
RUN go tool cover -html=coverage.out -o index.html \
    &&  rm coverage.out

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .


FROM scratch as production
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]
