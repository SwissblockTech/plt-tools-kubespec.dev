---
title: StorageClass
---

```yaml

apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ssd-csi-expandable
  labels:
    type: ssd
allowVolumeExpansion: true
parameters:
  type: pd-ssd
provisioner: pd.csi.storage.gke.io
reclaimPolicy: Retain
# Set "WaitForFirstConsumer" and binding mode to enable "Topology-Aware Volume Provisioning"
volumeBindingMode: WaitForFirstConsumer

```
