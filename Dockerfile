ARG IMAGE
FROM $IMAGE
#prereqs and binaries
ARG TERRAFORM_URL
ARG PACKER_URL
ADD $TERRAFORM_URL terraform.zip
ADD $PACKER_URL packer.zip
RUN apk add envsubst; for a in 'terraform' 'packer'; do unzip $a.zip -d /bin; rm $a.zip; done
#src code and config
COPY . .
RUN echo 'export $(cat /.env | xargs)' >> /etc/profile && chmod +x ./config.sh && ./config.sh
WORKDIR /terraform
RUN terraform init -backend-config=/root/backend.conf