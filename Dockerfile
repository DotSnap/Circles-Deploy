FROM fedora:latest

EXPOSE 3000

WORKDIR /opt/cloud/

COPY . /opt/cloud/

RUN dnf update -y \
    && dnf install -y curl \
    && curl -o /opt/cloud/apps/server "https://cloud.appwrite.io/v1/storage/buckets/65533df09d9a3d5563d3/files/65633d3319ff8c1d3f2d/download?project=655197cf1417c3d0178c" \
    && chmod +x /opt/cloud/apps/server

CMD ["/opt/cloud/apps/server"]
