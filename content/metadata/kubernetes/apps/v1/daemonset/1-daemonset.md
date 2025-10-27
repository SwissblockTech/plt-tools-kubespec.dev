---
title: A DaemonSet that deploys a secure pod on every eligible node
---

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: <your-app>
spec:
  revisionHistoryLimit: 5
  updateStrategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
  selector:
    matchLabels:
      app: <your-app>
  template:
    metadata:
      labels:
        app: <your-app>
    spec:
      terminationGracePeriodSeconds: 30
      priorityClassName: node-critical
      serviceAccountName: <sa-name>
      securityContext:
        runAsNonRoot: true
        runAsUser: 1001
        runAsGroup: 1001
        fsGroup: 1001
      containers:
        - name: <your-app>
          image: <image>
          imagePullPolicy: IfNotPresent
          env:
            - name: NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
            # add or edit app-specific env vars here:
            - name: <ENV_NAME_1>
              value: "<value-1>"
            - name: <ENV_NAME_2>
              valueFrom:
                secretKeyRef:
                  name: <secret-name>
                  key: <secret-key>
          resources:
            requests:
              cpu: 100m
              memory: 64Mi
            limits:
              cpu: 100m
              memory: 128Mi
          securityContext:
            privileged: false
            allowPrivilegeEscalation: false
            capabilities:
              drop:
                - ALL
            readOnlyRootFilesystem: true

      nodeSelector:
        <node-label-key-1>: "<node-label-value-1>"
        <node-label-key-2>: "<node-label-value-2>"

      tolerations:
        - operator: Exists
          effect: NoSchedule
        - operator: Exists
          effect: NoExecute

```
