---
title: CronJob
description: This example shows a CronJob that runs every monday at 12:30am
---

```yaml
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12 or jan-dec)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sun=0 or 7) or sun,mon,tue,wed,thu,fri,sat
# │ │ │ │ │
# * * * * *

apiVersion: batch/v1
kind: CronJob
metadata:
  name: <your-cronjob-name>
spec:
  schedule: "30 0 * * 1" -> Mondays at 00:30
  suspend: false
  concurrencyPolicy: Replace       # Allow | Forbid | Replace
  failedJobsHistoryLimit: 1
  successfulJobsHistoryLimit: 3
  jobTemplate:
    metadata:
      name: <your-cronjob-name>
    spec:
      backoffLimit: 1
      template:
        metadata:
          labels:
            app: <your-cronjob-name>
        spec:
          serviceAccountName: <sa-name>
          automountServiceAccountToken: false
          restartPolicy: OnFailure
          securityContext:
            runAsNonRoot: true
            runAsUser: 1001
            runAsGroup: 1001
            seccompProfile:
              type: RuntimeDefault
          containers:
            - name: <your-cronjob-name>
              image: <image>
              imagePullPolicy: IfNotPresent
              # command: ["/bin/sh"]
              # args: ["-c", "<your command>"]
              envFrom:
                - configMapRef:
                    name: <configmap-name>
                - secretRef:
                    name: <secret-name>
              resources:
                requests:
                  cpu: 100m
                  memory: 128Mi
                limits:
                  cpu: 500m
                  memory: 512Mi
              securityContext:
                allowPrivilegeEscalation: false
                readOnlyRootFilesystem: false
                capabilities:
                  drop:
                    - ALL
```
