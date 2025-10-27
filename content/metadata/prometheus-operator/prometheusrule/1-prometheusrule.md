---
title: PrometheusRule

```yaml

apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  labels:
    release: prometheus
  name: <rule-name>
spec:
  groups:
    - name: api
      rules:
        - alert: down
          expr: up == 0
          for: 0m
          labels:
            severity: critical
          annotations:
            summary: Prometheus target missing {{$labels.instance}}


```