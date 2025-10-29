---
title: Logging Operator Output (GCS)
---

```yaml
apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterOutput
metadata:
  name: gcs
  labels:
    sink: gcs
spec:
  gcs:
    client_retries: 10
    client_timeout: 5
    project: <PROJECT_NAME>
    bucket: <BUCKET_NAME>
    auto_create_bucket: true
    # path: ${tag}/%Y-%m-%d/
    path: ${tag}/%Y/%m/%d/%H/
    # available values: gzip (default), json, text
    store_as: text
    buffer:
      # timekey: 1h
      timekey: 5m
      # timekey_wait: 30s
      timekey_wait: 10s
      timekey_use_utc: true
      # chunk_limit_size: 10MB
      chunk_limit_size: 5MB
      # available values: text (default), gzip
      # compress: gzip
      flush_at_shutdown: true
      flush_mode: interval
      # flush_interval: 5m
      flush_interval: 1m
      retry_forever: false
      retry_max_times: 50
```