FROM mysql:8.0 
ENV MYSQL_DATABASE code_deps
ENV MYSQL_USER coder
COPY ./initdb/ /docker-entrypoint-initdb.d/
