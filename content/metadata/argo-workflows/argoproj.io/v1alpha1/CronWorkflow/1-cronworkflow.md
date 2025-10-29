---
title: CronWorkfflow example that runs every Sunday at 04:00 AM (4 AM)
---

```yaml
apiVersion: argoproj.io/v1alpha1
kind: CronWorkflow
metadata:
  name: <workflow-name>
spec:
  successfulJobsHistoryLimit: 3   # Number of successful jobs to retain
  failedJobsHistoryLimit: 3   # Number of failed jobs to retain
  schedule: 00 04 * * 0
  suspend: true
  concurrencyPolicy: "Forbid"
  serviceAccountName: <sa-name>
  workflowSpec:
    entrypoint: date
    templates:
    - name: date
      steps:
        - - name: notify-slack-start
              arguments:
                parameters:
                  - name: channel_id
                    value: <channel_id>
                  - name: namespace
                    value: <namespace>
              templateRef:
                name: slack-notification
                template: simple-notification
                clusterScope: true
        - - name: generate-kubeconfig
              arguments:
                parameters:
                  - name: gke_cluster
                    value: <cluster-name>
                  - name: gcp_zone
                    value: <gcp-zone-name>
                  - name: gcp_project
                    value: <gcp-project-name>
              templateRef:
                name: gke-generate-kubeconfig
                template: gke-generate-kubeconfig
                clusterScope: true
```