source /etc/profile

mkdir -p ~/.aws ~/.oci

mv /keys/oci_api_key.pem $TF_VAR_private_key_path

cat > ~/.aws/credentials << EOF
[default]
aws_access_key_id=${TF_VAR_access_key}
aws_secret_access_key=${TF_VAR_secret_key}
EOF

cat > ~/.oci/config << EOF
[DEFAULT]
tenancy=${TF_VAR_tenancy_ocid}
user=${TF_VAR_user_ocid}
key_file=${TF_VAR_private_key_path}
fingerprint=${TF_VAR_fingerprint}
region=${TF_VAR_region}
EOF

cat > /root/backend.conf << EOF
bucket = "${TF_VAR_terraform_bucket}"
region = "${TF_VAR_region}"
access_key = "${TF_VAR_access_key}"
secret_key = "${TF_VAR_secret_key}"
endpoint = "https://${TF_VAR_object_storage_namespace}.compat.objectstorage.${TF_VAR_region}.oraclecloud.com"
EOF

chmod 600 ~/.oci/*