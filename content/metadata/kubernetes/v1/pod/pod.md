---
title: Pod
---

```yaml

apiVersion: v1
kind: Pod
metadata:
  name: <pod-name>
  namespace: <namespace>
spec:
  containers:
    - name: <container-name>
      image: <image>
      livenessProbe:
        httpGet:
          path: <healthcheck-path>
          port: <port>
        initialDelaySeconds: 15
        periodSeconds: 10
        timeoutSeconds: 5
        successThreshold: 1
        failureThreshold: <failure-threshold>

```