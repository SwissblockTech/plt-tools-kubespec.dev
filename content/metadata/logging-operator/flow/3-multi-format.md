---
title: Flow with multi format

```yaml
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: loki-flow-<NAMESPACE>-<APP_NAME>
spec:
  match:
    - select:
        labels:
          app: <APP_NAME>
          # group:  <GROUP_LABEL_VALUE>

  filters:
    - parser:
        replace_invalid_sequence: true
        remove_key_name_field: true
        reserve_data: true
        reserve_time: true
        key_name: message
        parse:
          # WARN: mixed logs at the moment
          type: multi_format
          patterns:
            - format: json
              type: json
            - format: none

    - prometheus:
        metrics:
          - name: <NAMESPACE>_loki_logs_total
            desc: Total number of logs collected in the <NAMESPACE> namespace and sent to Grafana-Loki
            type: counter
        labels:
          namespace: $.kubernetes.namespace_name
          container: $.kubernetes.container_name
          app: $.kubernetes.labels.app
          domain: $.kubernetes.labels.domain
          group: $.kubernetes.labels.group
          level: $.level

  globalOutputRefs:
    - loki
```