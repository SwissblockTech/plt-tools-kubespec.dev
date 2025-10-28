---
title: ComputeManagedSLCertificate
---

```yaml
apiVersion: compute.cnrm.cloud.google.com/v1beta1
kind: ComputeSSLCertificate
metadata:
  name: <certificate_name>
spec:
  managed:
    domains:
    - <domain_name>
  projectRef:
    external: ${PROJECT_ID?}
  resourceID: <resource_id>
```