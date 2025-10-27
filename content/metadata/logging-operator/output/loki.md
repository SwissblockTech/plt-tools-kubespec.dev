---
title: Logging Operator Output (loki)

```yaml
apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterOutput
metadata:
  name: loki
  labels:
    sink: loki
spec:
  loki:
    url: <URL_NAME>

    # Configure Kubernetes metadata in a Prometheus like format
    configure_kubernetes_labels: true

    # Extract kubernetes labels as loki labels
    # extract_kubernetes_labels: true

    # Format to use when flattening the record to a log line: json, key_value (default: key_value)
    # WARN: refers to output format (after flattening) not input format!
    # line_format: key_value

    # Comma separated list of needless record keys to remove
    remove_keys:
      - stream
      - logtag

    # Loki is a multi-tenant log storage platform and all requests sent must include a tenant.
    # tenant: <TENANT_NAME>

    buffer:
      type: file
      # path - highly recommended to leave this default: /buffers

      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true

      flush_at_shutdown: true
      flush_thread_count: 2
      flush_mode: interval
      flush_interval: 15s

      retry_forever: false
      # available values:
      #   exponential_backoff - wait seconds will become large exponentially per failures
      #   periodic - output plugin will retry periodically with fixed intervals (configured via retry_wait)
      retry_type: exponential_backoff
      retry_max_interval: "30"
      retry_max_times: 10

      # available values:
      #   throw_exception - raise exception to show this error in log
      #   block - block processing of input plugin to emit events into that buffer
      #   drop_oldest_chunk - drop/purge oldest chunk to accept newly incoming chunk
      overflow_action: throw_exception
```