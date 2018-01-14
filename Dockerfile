FROM alpine
COPY microservice /microservice
ENTRYPOINT ["/microservice"]

EXPOSE 8080