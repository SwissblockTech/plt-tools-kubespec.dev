---
title: Argo CD Application
description: This example shows how to create an Application with auto-sync enabled.
---

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: <app-name>
  annotations:
    argocd.argoproj.io/sync-wave: "<sync-wave>"
spec:
  project: <argo-project>
  source:
    repoURL: <git-repo-url>
    targetRevision: <branch-or-tag>
    path: <manifest-path>
  destination:
    name: <cluster-name>
    namespace: <namespace>
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=<true|false>
      - ApplyOutOfSyncOnly=true
      - PrunePropagationPolicy=foreground
      - PruneLast=true
      - FailOnSharedResource=true
    retry:
      limit: 5
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 5m
```
