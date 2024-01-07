Get-Content .env | foreach {
  $name, $value = $_.split('=')
  Set-Content env:\$name $value.replace('"',"")
}

$IMAGE=$args[0]
$TARGET="$env:TF_VAR_region.ocir.io/$env:TF_VAR_object_storage_namespace/$IMAGE"

echo $env:OCIR_AUTH_TOKEN | docker login -u $env:TF_VAR_object_storage_namespace/$env:EMAIL --password-stdin https://$env:TF_VAR_region.ocir.io
docker tag $IMAGE $TARGET
docker push $TARGET