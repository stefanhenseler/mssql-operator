FROM golang:1.9-alpine as builder
WORKDIR /go/src/github.com/synax/mssql-operator
RUN go get -d -t github.com/synax/mssql-operator
RUN GOOS=linux CGO_ENABLED=0 go build -gcflags "-N -l" -o mssql-operator

FROM alpine:latest 
COPY --from=builder mssql-operator .
ENTRYPOINT ["/mssql-operator"]

EXPOSE 8080