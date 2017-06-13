# problem statement
creates an azure container service instance (if doesn't already exist)

# example usage

> note: in examples, VERSION represents a version of the azure.acs.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.acs.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.acs.create#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.acs.create#VERSION }
    inputs: 
      subscriptionId:
      spId:
      spTenantId:
      spClientSecret:
      name:
      resourceGroup:
      dnsPrefix:
      sshKeyValue:
      # begin optional args
      adminUsername:
      agentCount:
      agentVmSize:
      location:
      masterCount:
      orchestratorType:
      # end optional args
```

