FROM mcr.microsoft.com/mssql/server:2022-latest
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Appl3s123
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433

WORKDIR /tmp

COPY AdventureWorksLT2017.bak .
COPY restore-database.sql .

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 15 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Appl3s123" -i /tmp/restore-database.sql \
