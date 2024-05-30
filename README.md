[![build](https://github.com/opspec-pkgs/azure.acs.create/actions/workflows/build.yml/badge.svg)](https://github.com/opspec-pkgs/azure.acs.create/actions/workflows/build.yml)


<img src="icon.svg" alt="icon" height="100px">

# Problem statement

creates an azure container service instance (if doesn't already exist)

# Example usage

## Visualize

```shell
opctl ui github.com/opspec-pkgs/azure.acs.create#2.2.0
```

## Run

```
opctl run github.com/opspec-pkgs/azure.acs.create#2.2.0
```

## Compose

```yaml
op:
  ref: github.com/opspec-pkgs/azure.acs.create#2.2.0
  inputs:
    dnsPrefix:  # 👈 required; provide a value
    loginId:  # 👈 required; provide a value
    loginSecret:  # 👈 required; provide a value
    name:  # 👈 required; provide a value
    resourceGroup:  # 👈 required; provide a value
    sshKeyValue:  # 👈 required; provide a value
    subscriptionId:  # 👈 required; provide a value
  ## uncomment to override defaults
  #   adminUsername: "azureuser"
  #   agentCount: 1
  #   agentDiskSize: 30
  #   agentStorageProfile: " "
  #   agentVmSize: "Standard_D2_v2"
  #   agentVnetSubnetId: " "
  #   clientSecret: " "
  #   location: "westus2"
  #   loginTenantId: " "
  #   loginType: "user"
  #   masterCount: 1
  #   masterDiskSize: 30
  #   masterFirstStaticIP: " "
  #   masterVnetSubnetId: " "
  #   orchestratorType: "DCOS"
  #   servicePrincipal: " "
```

# Support

join us on
[![Slack](https://img.shields.io/badge/slack-opctl-E01563.svg)](https://join.slack.com/t/opctl/shared_invite/zt-51zodvjn-Ul_UXfkhqYLWZPQTvNPp5w)
or
[open an issue](https://github.com/opspec-pkgs/azure.acs.create/issues)

# Releases

releases are versioned according to
[![semver 2.0.0](https://img.shields.io/badge/semver-2.0.0-brightgreen.svg)](http://semver.org/spec/v2.0.0.html)
and [tagged](https://git-scm.com/book/en/v2/Git-Basics-Tagging); see
[CHANGELOG.md](CHANGELOG.md) for release notes

# Contributing

see
[project/CONTRIBUTING.md](https://github.com/opspec-pkgs/project/blob/main/CONTRIBUTING.md)
