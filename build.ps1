$IMAGE="alpine:3.19.0"
$TERRAFORM_URL="https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip"
$PACKER_URL="https://releases.hashicorp.com/packer/1.10.0/packer_1.10.0_linux_amd64.zip"

docker build -t infrastructure . --build-arg IMAGE=$IMAGE --build-arg TERRAFORM_URL=$TERRAFORM_URL --build-arg PACKER_URL=$PACKER_URL