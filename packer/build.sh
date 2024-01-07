cd $(dirname $0)
cd ../terraform
packer build \
-var subnet_ocid=$(terraform output subnet_id) \
-var compartment_ocid=$(terraform output compartment_id) \
-var image_name=main ../packer/main.pkr.hcl