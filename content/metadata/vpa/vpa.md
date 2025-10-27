---
title: Vertical Pod Autoscaler
---

```yaml

apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: <VPA_NAME>
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: <APP_NAME>
  updatePolicy:
    updateMode: "Off"
```
