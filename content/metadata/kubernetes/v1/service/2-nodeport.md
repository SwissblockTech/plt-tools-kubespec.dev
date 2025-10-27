---
title: Create a service of type NodePort
description: This service will expose pod's matching label app=my-app on port 30000 of each node.
---

```yaml
apiVersion: v1
kind: Service
metadata:
  name: <app-name>
  labels:
    app: <app-name>
spec:
  type: NodePort
  ports:
    - name:  <port-name>
      port: <port>  # service port
      protocol: TCP
      targetPort: <target-port>  # pod's port for internal routing
  selector:
    app: <pod-selector-label>
```
