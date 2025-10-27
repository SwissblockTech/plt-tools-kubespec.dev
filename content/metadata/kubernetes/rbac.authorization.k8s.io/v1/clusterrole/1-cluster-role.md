---
title: Cluster Role
---

```yaml

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: <clusterrole-name>  # ClusterRoles are cluster-scoped (not namespaced)
rules:
- apiGroups: ["<api-group>"]
  resources: ["<resource-name>"]
  verbs: ["get", "watch", "list", "create", "update", "delete"]

```
