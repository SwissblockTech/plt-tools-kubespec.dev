---
title: IAM Service Account
---

```yaml
apiVersion: compute.cnrm.cloud.google.com/v1beta1
kind: ComputeNetwork
metadata:
  annotations:
    cnrm.cloud.google.com/project-id: <PROJECT_ID>
  name: <NETWORK_NAME>
spec:
  routingMode: <REGIONAL>
  autoCreateSubnetworks: <false>
```