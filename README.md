# prereq
- create .env file at the root of this repo
```
TF_VAR_tenancy_ocid=""
TF_VAR_user_ocid=""
TF_VAR_private_key_path="/root/.oci/oci_api_key.pem"
TF_VAR_fingerprint=""
TF_VAR_region="us-ashburn-1"
TF_VAR_secret_key=""
TF_VAR_access_key=""
TF_VAR_object_storage_namespace=""
TF_VAR_terraform_bucket="terraform-states"
PKR_VAR_az="qAJY:US-ASHBURN-AD-1"
PKR_VAR_ssh_username="opc"
PKR_VAR_instance_type="VM.Standard.A1.Flex"
PKR_VAR_num_cores="2"
PKR_VAR_image_name="main"
```
- create keys folder and populate with keys

# build
```
#linux
./build.sh
#windows
./build.ps1
```

# run
```
docker run --rm -it --name infrastructure infrastructure
```

# push to oci registry
```
#windows
./push.ps1 <image> <auth_token>
```