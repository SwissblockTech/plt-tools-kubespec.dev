---
title: Role
---

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: <role-name>  # Roles are namespaced
rules:
- apiGroups: ["<api-group>"]
  resources: ["<resource-name>"]
  verbs: ["get", "watch", "list", "create", "update", "delete"]

```
