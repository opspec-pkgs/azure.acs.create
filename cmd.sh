#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

### convert ssh cert file to string
export sshKeyValueString="$(cat /sshKeyValue)"

echo "generating arm template and parameters files"
cat /clusterDefinition.json | envsubst > /tmp/clusterDefinition.json
acs-engine generate /tmp/clusterDefinition.json

echo "creating resource group deployment"
az group deployment create \
    --resource-group "$resourceGroup" \
    --mode "$mode" \
    --name "$name" \
    --parameters "@/_output/$name/azuredeploy.parameters.json" \
    --template-file "/_output/$name/azuredeploy.json"

