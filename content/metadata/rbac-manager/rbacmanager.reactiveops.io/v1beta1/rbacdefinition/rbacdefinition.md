---
title: RBACDefinition
---

```yaml

apiVersion: rbacmanager.reactiveops.io/v1beta1
kind: RBACDefinition
metadata:
  name: team
rbacBindings:
  - name: user
    subjects:
      - kind: User
        name: user@swissblock.net
    clusterRoleBindings:
      - clusterRole: temp-sbt-namespace
    roleBindings:
      - clusterRole: temp-sbt-port-forward
        namespaceSelector:
          matchExpressions:
            - key: domain
              operator: In
              values:
                - <NAMESPACE>
  - name: service-account
    subjects:
      - kind: ServiceAccount
        name: service-account@GCP_PROJ_NAME.iam.gserviceaccount.com
    clusterRoleBindings:
      - clusterRole: temp-sbt-namespace
    roleBindings:
      - clusterRole: temp-sbt-edit
        namespaceSelector:
          matchExpressions:
            - key: domain
              operator: In
              values:
                - <NAMESPACE>


```