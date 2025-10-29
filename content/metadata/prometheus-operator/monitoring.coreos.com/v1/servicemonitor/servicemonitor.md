---
title: ServiceMonitor
---

```yaml

apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: <NAMESPACE>-<APP_NAME>
spec:
  selector:
    matchLabels:
      app: ...
      domain: ...
      group: ...
  namespaceSelector:
    matchNames:
      - <NAMESPACE>
  endpoints:
    - port: http
      path: /metrics
      interval: 15s
      scrapeTimeout: 14s

```