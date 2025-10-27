---
title: CloudSQLInstance(Postgres)
---

```yaml
apiVersion: sql.cnrm.cloud.google.com/v1beta1
kind: SQLInstance
metadata:
  annotations:
    cnrm.cloud.google.com/project-id: <project-id>
  name: <instance-name>
spec:
  databaseVersion: POSTGRES_16
  instanceType: CLOUD_SQL_INSTANCE
  maintenanceVersion: POSTGRES_16_9.R20250727.00_14
  region: europe-west4
  resourceID: <resource-id>
  settings:
    activationPolicy: ALWAYS
    availabilityType: ZONAL
    backupConfiguration:
      backupRetentionSettings:
        retainedBackups: 15
        retentionUnit: COUNT
      enabled: true
      location: eu
      startTime: "00:00"
      transactionLogRetentionDays: 7
    connectorEnforcement: NOT_REQUIRED
    deletionProtectionEnabled: true
    diskAutoresize: true
    diskAutoresizeLimit: 0
    diskSize: 100
    diskType: PD_SSD
    edition: ENTERPRISE
    insightsConfig:
      queryStringLength: 4000
    ipConfiguration:
      allocatedIpRange: google-managed-services-default
      enablePrivatePathForGoogleCloudServices: true
      ipv4Enabled: false
      privateNetworkRef:
        external: projects/{{ project_id }}/global/networks/default
    locationPreference:
      zone: europe-west4-a
    pricingPlan: PER_USE
    tier: db-custom-2-8192
```