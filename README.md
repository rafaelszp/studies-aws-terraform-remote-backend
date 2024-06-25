# terraform remote backend

## Desc

My intent in this example is to demonstrate a pratical use of remote terraform state with locking features provided by S3 and DynamoDB. 

Other feature it's important to mention is that I created an IAM Role to be attached to EC2 with `sts:AssumeRole` trust relationship. When an hypothetical EC2 instance is hooked with this role, it will be able to perform read operations in S3 buckets, provided by an specific managed policy also attached to the aforementioned role.

## Services required
- s3
- dynamodb


## TODO
1. Create specific role to use in backend session with only needed permissions


## References
1. https://developer.hashicorp.com/terraform/language/settings/backends/s3

