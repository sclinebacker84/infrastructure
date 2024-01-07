cd $(dirname $0)
packer init main.pkr.hcl
cd ../terraform
packer build \
-var subnet=$(terraform output -raw subnet_id) \
-var group=$(terraform output -raw compartment_id) \
../packer/main.pkr.hcl