#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'
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

echo "checking for exiting ACS instance"
if [ "$(az acs list --resource-group "$resourceGroup")" != "[]" ]
then
  echo "found exiting ACS instance"
else
  echo "creating ACS instance"
  az acs create \
    --name "$name" \
    --resource-group "$resourceGroup" \
    --admin-username "$adminUsername" \
    --agent-count "$agentCount" \
    --agent-vm-size "$agentVmSize" \
    --client-secret "$clientSecret" \
    --dns-prefix "$dnsPrefix" \
    --location "$location" \
    --master-count "$masterCount" \
    --orchestrator-type "$orchestratorType" \
    --service-principal "$servicePrincipal" \
    --ssh-key-value "/sshKeyValue"
fi
