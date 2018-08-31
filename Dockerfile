FROM golang:1.11-alpine as builder

WORKDIR /build
COPY . /build
RUN apk add --update --no-cache git
RUN go get github.com/t-yuki/gocover-cobertura \
    && go get github.com/2tvenom/go-test-teamcity \
    && cd /build

RUN go test -v -coverprofile=coverage.txt -covermode=count ./... | go-test-teamcity
RUN gocover-cobertura < coverage.txt > coverage.xml \
    &&  rm coverage.txt

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .


FROM scratch as production
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]
