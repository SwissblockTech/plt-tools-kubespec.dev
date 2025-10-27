---
title: IAM Service Account
---

```yaml
apiVersion: compute.cnrm.cloud.google.com/v1beta1
kind: ComputeSubnetwork
metadata:
  annotations:
    cnrm.cloud.google.com/project-id: <PROJECT_ID>
  name: <SUBNET_NAME>
spec:
  ipCidrRange: <CIDR_BLOCK>
  region: <REGION>
  description: <DESCRIPTION>
  privateIpGoogleAccess: <false>
  networkRef:
    name: <NETWORK_NAME>
```