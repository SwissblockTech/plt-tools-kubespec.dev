---
title: An Deployment example with one container, with a configmap volume and emptydir volume
---

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: <your-app>
spec:
  replicas: 1
  revisionHistoryLimit: 5
  template:
    metadata:
      annotations:
        .......
    spec:
      securityContext:
        runAsNonRoot: true
        runAsUser: 1000
        runAsGroup: 1000
        fsGroup: 2000
        seccompProfile:
          type: RuntimeDefault
      serviceAccountName: ds-wikis
      containers:
        - name: <container-name>
          image: <image-name>
          imagePullPolicy: IfNotPresent
          ports:
            - name: .....
              containerPort: .....
          resources:
            requests:
              cpu: 100m
              memory: 128Mi
            limits:
              cpu: 200m
              memory: 256Mi
          securityContext:
            privileged: false
            allowPrivilegeEscalation: false
            capabilities:
              drop:
                - ALL
            readOnlyRootFilesystem: false
          volumeMounts:
            - name: <volume-name>
              mountPath: <mount-path>
            - name: <volume-name>
              mountPath: <mount-path>
      volumes:
        - name: <volume-name>
          configMap:
            name: <configmap-name>
        - name: <volume-name>
          emptyDir:
            sizeLimit: <size-limit>
```
