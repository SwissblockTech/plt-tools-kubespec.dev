---
title: App Project
---

```yaml

apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: <project-name>
  namespace: <argocd-namespace>
spec:
  clusterResourceWhitelist:
    - group: "*"
      kind: "*"
  destinations:
    - namespace: <destination-namespace>
      server: <cluster-api-server>
  sourceRepos:
    - <repo-url>
  # Allow all namespaced-scoped resources to be created, except for ResourceQuota, LimitRange, NetworkPolicy
  namespaceResourceBlacklist:
  - group: ''
    kind: ResourceQuota
  - group: ''
    kind: LimitRange
  - group: ''
    kind: NetworkPolicy
  # Deny all namespaced-scoped resources from being created, except for Deployment and StatefulSet
  namespaceResourceWhitelist:
  - group: 'apps'
    kind: Deployment
  - group: 'apps'
    kind: StatefulSet

```