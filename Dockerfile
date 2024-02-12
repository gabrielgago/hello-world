FROM golang:1.22-alpine as golang

ENV GOOS=linux

WORKDIR /usr/src/app

COPY go.mod hello.go ./

RUN go mod download && go mod verify

RUN go build -o binario-desafio-fc ./...

RUN chmod 777 binario-desafio-fc

FROM scratch

COPY --from=golang /usr/src/app/binario-desafio-fc /binario-desafio-fc

CMD ["/binario-desafio-fc"]