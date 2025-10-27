---
title: Headless Service
---

```yaml
apiVersion: v1
kind: Service
metadata:
  name: <app-name>-headless
  labels:
    app: <app-name>-headless
spec:
  clusterIP: None     # makes it headless
  ports:
      port: <port>  # service port
      protocol: TCP
      targetPort: <target-port>  # pod's port for internal routing
  selector:
    app: <pod-selector-label>
```