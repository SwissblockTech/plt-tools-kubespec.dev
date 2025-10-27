---
title: Create a Role named 'pod-reader-role-alice'
description: A simple Role that gives read permissions for a human user `Alice` on all pods in dev namespace. Refer to the associated RoleBinding example `pod-reader-role-binding-alice` for the configuration to be complete.
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
