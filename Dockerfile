FROM alpine
COPY .build/mssql-operator /mssql-operator
ENTRYPOINT ["/mssql-operator"]

EXPOSE 8080