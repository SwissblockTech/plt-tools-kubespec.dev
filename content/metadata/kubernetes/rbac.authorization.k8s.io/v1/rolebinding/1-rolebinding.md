---
title: RoleBinding
---

```yaml

apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: <rolebinding-name>
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: <role-name>
subjects:
  - kind: ServiceAccount
    name: <sa-name>
    namespace: <sa-namespace>

```
