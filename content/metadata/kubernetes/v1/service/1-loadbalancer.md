---
title: Service of type LoadBalancer
---

```yaml
piVersion: v1
kind: Service
metadata:
  name: <app-name>
  labels:
    app: <app-name>
spec:
  type: LoadBalancer
  ports:
    - name:  <port-name>
      port: <port>  # service port
      protocol: TCP
      targetPort: <target-port>  # pod's port for internal routing
  selector:
    app: <pod-selector-label>
```
