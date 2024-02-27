FROM golang:1.22

WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"

RUN usermod -u 1000 www-data
RUN mkdir -p /var/www/.cache
RUN chown -R www-data:www-data /go
RUN chown -R www-data:www-data /var/www/.cache


RUN apt-get update && apt-get install -y \
    sqlite3 \
    gcc

USER www-data


CMD ["tail", "-f", "/dev/null"]