---
title: A ConfigMap with file content
description: Some apps might require a json, yaml, toml, etc file to configure themselves. This example shows how to create a ConfigMap with an ini file content.
---

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: <configmap-name>
data:
  <filename>.conf: |
    .........
```
