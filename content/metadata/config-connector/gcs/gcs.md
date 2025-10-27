---
title: Storage bucket
---

```yaml

---
apiVersion: storage.cnrm.cloud.google.com/v1beta1
kind: StorageBucket
metadata:
  name: <bucket-name>
spec:
  location: <location>
  publicAccessPrevention: inherited
  resourceID: <resource-id>
  softDeletePolicy:
    retentionDurationSeconds: 604800
  storageClass: COLDLINE
  uniformBucketLevelAccess: true

```