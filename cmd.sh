#!/usr/bin/env sh

### install deps
echo "installing gettext"
apt-get update
apt-get install gettext -y

### populate clusterDefinition.json values
# cat /clusterDefinition.json | envsubst > /tmp/clusterDefinition.json
# cat /tmp/clusterDefinition.json

### generate arm template and parameters files
# acs-engine generate /tmp/clusterDefinition.json

# ### begin create/update
# echo "checking for exiting ACS instance"
# if [ "$(az acs list --resource-group "$resourceGroup")" != "[]" ]
# then
#   echo "found exiting ACS instance"
# else
#   acsCreateCmd='az acs create'
#   acsCreateCmd=$(printf "%s --name %s" "$acsCreateCmd" "$name")
#   acsCreateCmd=$(printf "%s --resource-group %s" "$acsCreateCmd" "$resourceGroup")
#   acsCreateCmd=$(printf "%s --admin-username %s" "$acsCreateCmd" "$adminUsername")
#   acsCreateCmd=$(printf "%s --agent-count %s" "$acsCreateCmd" "$agentCount")
#   acsCreateCmd=$(printf "%s --agent-vm-size %s" "$acsCreateCmd" "$agentVmSize")
#   acsCreateCmd=$(printf "%s --dns-prefix %s" "$acsCreateCmd" "$dnsPrefix")
#   acsCreateCmd=$(printf "%s --location %s" "$acsCreateCmd" "$location")
#   acsCreateCmd=$(printf "%s --master-count %s" "$acsCreateCmd" "$masterCount")
#   acsCreateCmd=$(printf "%s --orchestrator-type %s" "$acsCreateCmd" "$orchestratorType")
#   acsCreateCmd=$(printf "%s --ssh-key-value /sshKeyValue" "$acsCreateCmd")

#   # handle opts
#   if [ "$clientSecret" != " " ]; then
#     acsCreateCmd=$(printf "%s --client-secret %s" "$acsCreateCmd" "$clientSecret")
#   fi

#   if [ "$servicePrincipal" != " " ]; then
#     acsCreateCmd=$(printf "%s --service-principal %s" "$acsCreateCmd" "$servicePrincipal")
#   fi

# # add vnet, disk agent disk size, consecutive IP. 

#   if [ "$agentDiskSize" != 30 ]; then
#     acsCreateCmd=$(printf "%s --agent-osdisk-size %s" "$acsCreateCmd" "$agentDiskSize")
#   fi

#   if [ "$agentVnetSubnetId" != " " ]; then
#     acsCreateCmd=$(printf "%s --agent-vnet-subnet-id %s" "$acsCreateCmd" "$agentVnetSubnetId")
#   fi

#   if [ "$masterVnetSubnetId" != " " ]; then
#     acsCreateCmd=$(printf "%s --master-vnet-subnet-id %s" "$acsCreateCmd" "$masterVnetSubnetId")
#   fi

#   if [ "$masterDiskSize" != 30 ]; then
#     acsCreateCmd=$(printf "%s --master-osdisk-size %s" "$acsCreateCmd" "$masterDiskSize")
#   fi

#   if [ "$masterFirstStaticIP" != " " ]; then
#     acsCreateCmd=$(printf "%s --master-first-consecutive-static-ip %s" "$acsCreateCmd" "$masterFirstStaticIP")
#   fi

#   if [ "$agentStorageProfile" != " " ]; then
#     acsCreateCmd=$(printf "%s --agent-storage-profile %s" "$acsCreateCmd" "$agentStorageProfile")
#   fi

#   echo "creating ACS instance"
#   eval "$acsCreateCmd"
# fi

# ### end create/update
