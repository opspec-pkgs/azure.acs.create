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

### begin create/update
echo "checking for exiting ACS instance"
if [ "$(az acs list --resource-group "$resourceGroup")" != "[]" ]
then
  echo "found exiting ACS instance"
else
  acsCreateCmd='az acs create'
  acsCreateCmd=$(printf "%s --name %s" "$acsCreateCmd" "$name")
  acsCreateCmd=$(printf "%s --resource-group %s" "$acsCreateCmd" "$resourceGroup")
  acsCreateCmd=$(printf "%s --admin-username %s" "$acsCreateCmd" "$adminUsername")
  acsCreateCmd=$(printf "%s --agent-count %s" "$acsCreateCmd" "$agentCount")
  acsCreateCmd=$(printf "%s --agent-vm-size %s" "$acsCreateCmd" "$agentVmSize")
  acsCreateCmd=$(printf "%s --dns-prefix %s" "$acsCreateCmd" "$dnsPrefix")
  acsCreateCmd=$(printf "%s --location %s" "$acsCreateCmd" "$location")
  acsCreateCmd=$(printf "%s --master-count %s" "$acsCreateCmd" "$masterCount")
  acsCreateCmd=$(printf "%s --orchestrator-type %s" "$acsCreateCmd" "$orchestratorType")
  acsCreateCmd=$(printf "%s --ssh-key-value /sshKeyValue" "$acsCreateCmd")

  # handle opts
  if [ "$clientSecret" != " " ]; then
    acsCreateCmd=$(printf "%s --client-secret %s" "$acsCreateCmd" "$clientSecret")
  fi

  if [ "$servicePrincipal" != " " ]; then
    acsCreateCmd=$(printf "%s --service-principal %s" "$acsCreateCmd" "$servicePrincipal")
  fi

  echo "creating ACS instance"
  eval "$acsCreateCmd"
fi

### end create/update
