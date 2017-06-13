#!/usr/bin/env sh

echo "logging in to azure"
az login --service-principal -u "$spId" -p "$spClientSecret" --tenant "$spTenantId" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting ACS instance"
if [ "$(az acs list --resource-group "$resourceGroup")" != "[]" ]
then
  echo "found exiting ACS instance in this resource group. choose a different resource group"
else
  echo "creating ACS instance"
  az acs create \
    --name "$name" \
    --resource-group "$resourceGroup" \
    --admin-username "$adminUsername" \
    --agent-count "$agentCount" \
    --agent-vm-size "$agentVmSize" \
    --client-secret "$spClientSecret" \
    --dns-prefix "$dnsPrefix" \
    --location "$location" \
    --master-count "$masterCount" \
    --orchestrator-type "$orchestratorType" \
    --service-principal "$spId" \
    --ssh-key-value "/sshKeyValue"
fi
