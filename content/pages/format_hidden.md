Title: Markdown format
Date: 2021-07-27 14:17
Modified: 2021-07-27 15:55
Category: Python
Tags: pelican, publishing
Slug: format
Authors: Jolene Yu
Summary: Short version for index and feeds
status: hidden

# Lendi Terraform modules - rds

This module is a wrapper around the AWS terraform RDS module with Lendi specific configuration values.

## Providers

### Terraform

It is recommended to use terraform >= 1.0.0

`.terraform-version`

```sh
1.0.3
```

### aws

Required as this is an AWS module.

```hcl
provider "aws" {
  region     = "ap-southeast-2"
}
```

## Parameters

[variables.tf](variables.tf)

| name           | required | type   | default                                           | comments                                                  |
| -------------- | -------- | ------ | ------------------------------------------------- | --------------------------------------------------------- |
| environment    | yes      | string | development                                       | Environment that will be deployed                         |
| team           | yes      | string |                                                   | Team responsible for service                              |
| project        | yes      | string |                                                   | Project being deployed, same as LCD                       |
| namespace      | no       | string | lcd default namespace config                      | Namespace                                                 |
| slack_channel  | no       | string |                                                   | Slack channel that alerts are gonig to send message to    |
| num_containers | no       | map    | development/staging = 2 production,management = 3 | Number of containers per environment                      |
| slo_enabled    | no       | bool   | false                                             | Creates SLO pod availability based on monitor (prod only) |

## Example

Here is an example of this module being used

```hcl
module "integration-test-aws-rds" {
  source = "s3::https://s3-ap-southeast-2.amazonaws.com/platform-terraform-module-management/aws-rds/"
  ## variables for the module
  environment = "management"
  team = "platform"
  project = "harbor-registry-db"
  tag = "latest"
  git_repo = "lendi-infrastructure"
  db_allow_major_version_upgrade = true
}
```
