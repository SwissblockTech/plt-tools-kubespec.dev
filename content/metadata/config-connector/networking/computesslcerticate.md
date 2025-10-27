---
title: ComputeSSLCertificate
---

```yaml
apiVersion: compute.cnrm.cloud.google.com/v1beta1
kind: ComputeSSLCertificate
metadata:
  annotations:
    cnrm.cloud.google.com/project-id: <project_id>
  name: <certificate_name>
spec:
  certificate:
    value: |
      -----BEGIN CERTIFICATE-----
      ...........................
      -----END CERTIFICATE-----
  location: global
  resourceID: <certificate_name>
```