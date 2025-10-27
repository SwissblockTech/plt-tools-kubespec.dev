---
title: A Job
description: This example shows how to create a Job that prints a message to stdout.

---

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: <your-job-name>
spec:
  backoffLimit: 1
  template:
    spec:
      serviceAccountName: <sa-name>
      automountServiceAccountToken: false
      restartPolicy: OnFailure
      securityContext:
        runAsNonRoot: true
        runAsUser: 1001
        runAsGroup: 1001
        fsGroup: 1001
        seccompProfile:
          type: RuntimeDefault
      containers:
        - name: <container-name>
          image: <image>
          imagePullPolicy: IfNotPresent
          command: ['echo', 'Hello from Kubernetes Job']
          envFrom:
            - configMapRef:
                name: <configmap-name>
          resources:
            requests:
              cpu: 100m
              memory: 256Mi
            limits:
              cpu: 500m
              memory: 1Gi
          securityContext:
            allowPrivilegeEscalation: false
            readOnlyRootFilesystem: false
            capabilities:
              drop:
                - ALL
```
