---
title: An Deployment example with two containers
---

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: <your-app>
spec:
  replicas: 1
  revisionHistoryLimit: 5
  selector:
    matchLabels:
      app: <your-app>
  template:
    metadata:
      labels:
        app: <your-app>
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
      serviceAccountName: <sa-name>
      containers:
        - name: <container-name-1>
          image: <image-name-1>
          imagePullPolicy: IfNotPresent
          ports:
            - name: <port-name-1>
              containerPort: <port-1>
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
            - name: <config-volume>
              mountPath: <config-mount-path>
            - name: <data-volume>
              mountPath: <data-mount-path>

        - name: <container-name-2>
          image: <image-name-2>
          imagePullPolicy: IfNotPresent
          ports:
            - name: <port-name-2>
              containerPort: <port-2>
          resources:
            requests:
              cpu: 50m
              memory: 64Mi
            limits:
              cpu: 150m
              memory: 128Mi
          securityContext:
            privileged: false
            allowPrivilegeEscalation: false
            capabilities:
              drop:
                - ALL
            readOnlyRootFilesystem: true
          volumeMounts:
            - name: <data-volume>
              mountPath: <shared-data-path>

      volumes:
        - name: <config-volume>
          configMap:
            name: <config-name>
        - name: <data-volume>
          emptyDir:
            sizeLimit: <size-limit>
```
