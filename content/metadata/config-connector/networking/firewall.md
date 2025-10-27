---
title: Compute Firewall
---

```yaml
apiVersion: compute.cnrm.cloud.google.com/v1beta1
kind: ComputeFirewall
metadata:
  annotations:
    cnrm.cloud.google.com/project-id: <PROJECT_ID>
  name: <FIREWALL_NAME>
spec:
  allow:
  - protocol: <PROTOCOL>
  description: <DESCRIPTION>
  direction: <DIRECTION>
  networkRef:
    external: https://www.googleapis.com/compute/v1/projects/<PROJECT_ID>/global/networks/<NETWORK_NAME>
  priority: <PRIORITY>
  resourceID: <RESOURCE_ID>
  sourceRanges:
  - <SOURCE_RANGE>
```