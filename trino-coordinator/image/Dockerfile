FROM trinodb/trino:430
USER root

RUN apt-get update
RUN apt-get install uuid-runtime unzip

# Copy default cofig files to image
COPY /etc /etc/trino
COPY /catalog.zip catalog/catalog.zip
RUN chown -R trino:trino /etc/trino

# ENV SHARED_SECRET for testing
ENV SHARED_SECRET='this-is-an-very-secret-shared-secret'

# Copy script to ajust
COPY scripts/__cacert_entrypoint.sh /__cacert_entrypoint.sh
RUN chmod +x /__cacert_entrypoint.sh
