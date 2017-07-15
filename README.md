# Problem statement
creates an azure container service instance (if doesn't already exist)

# Example usage

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
op:
  pkg: { ref: github.com/opspec-pkgs/azure.acs.create#VERSION }
  inputs: 
    subscriptionId:
    loginId:
    loginSecret:
    name:
    resourceGroup:
    dnsPrefix:
    sshKeyValue:
    # begin optional args
    adminUsername:
    agentCount:
    agentVmSize:
    clientSecret:
    location:
    loginTenantId:
    loginType:
    masterCount:
    orchestratorType:
    servicePrincipal:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.acs.create/issues)
