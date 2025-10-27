---
title: IAM Service Account
---

```yaml
apiVersion: compute.cnrm.cloud.google.com/v1beta1
kind: ComputeAddress
metadata:
  annotations:
    cnrm.cloud.google.com/project-id: <PROJECT_ID>
  name: <ADDRESS_NAME>
spec:
  address: <INTERNAL_IP>
  addressType: INTERNAL
  location: <REGION>
  networkTier: PREMIUM
  purpose: GCE_ENDPOINT
  resourceID: <RESOURCE_ID>
  subnetworkRef:
    external: https://www.googleapis.com/compute/v1/projects/<PROJECT_ID>/regions/<REGION>/subnetworks/<SUBNETWORK_NAME>
```