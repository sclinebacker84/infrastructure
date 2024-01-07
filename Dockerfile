FROM alpine:3.19.0
RUN apk add envsubst
#terraform
ADD https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip terraform.zip
RUN unzip terraform.zip -d /bin && rm terraform.zip
#packer
ADD https://releases.hashicorp.com/packer/1.10.0/packer_1.10.0_linux_amd64.zip packer.zip
RUN unzip packer.zip -d /bin && rm packer.zip
#src code and config
COPY terraform/ /terraform/
COPY packer/ /packer/
COPY keys/ /keys/
COPY .env .env
RUN export $(cat .env | xargs) && cat terraform/backend.tf.template | envsubst > terraform/backend.tf && cat packer/main.pkr.hcl.template | envsubst > packer/main.pkr.hcl
RUN mkdir -p ~/.aws && echo -e "[default]\naws_access_key_id=${TF_VAR_access_key}\naws_secret_access_key=${TF_VAR_secret_key}" > ~/.aws/credentials
WORKDIR /terraform
RUN terraform init
