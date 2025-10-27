---
title: IAMPartialPolicy for user
---

```yaml

apiVersion: iam.cnrm.cloud.google.com/v1beta1
kind: IAMPartialPolicy
metadata:
  name: <policy-name>
spec:
  resourceRef:
    apiVersion: resourcemanager.cnrm.cloud.google.com/v1beta1
    kind: Project
    external: projects/<gcp-project-id>
  bindings:
    - role: roles/storage.objectUser
      members:
        - member: user:<user-email>
      condition:
        expression: resource.name.startsWith("projects/_/buckets/<gcs-bucket-name>")
        title: GCS bucket <gcs-bucket-name>
    - role: roles/container.clusterViewer
      members:
       - member: user:<user-email>

```