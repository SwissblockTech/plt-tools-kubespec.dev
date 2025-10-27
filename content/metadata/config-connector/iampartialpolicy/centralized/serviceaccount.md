---
title: IAMPartialPolicy for a service-account with an IAMPolicyMember
---

```yaml

apiVersion: iam.cnrm.cloud.google.com/v1beta1
kind: IAMPartialPolicy
metadata:
  name: <policy-name>
spec:
  resourceRef:
    apiVersion: resourcemanager.cnrm.cloud.google.com/v1beta1
    kind: Project
    external: projects/<gcp-project-id>
  bindings:
    - role: roles/iam.workloadIdentityUser
      members:
        - member: serviceAccount:<gcp-service-account-name>@<gcp-project-id>.iam.gserviceaccount.com
    - role: roles/storage.objectAdmin
      members:
        - member: serviceAccount:<gcp-service-account-name>@<gcp-project-id>.iam.gserviceaccount.com
      condition:
        expression: resource.name.startsWith("projects/_/buckets/<gcs-bucket-name>")
        title: GCS bucket <gcs-bucket-name>

---
apiVersion: iam.cnrm.cloud.google.com/v1beta1
kind: IAMPolicyMember
metadata:
  name: <policy-member-name>
spec:
  member: serviceAccount:<gcp-project-id>.svc.id.goog[<k8s-namespace>/<k8s-service-account>]
  role: roles/iam.workloadIdentityUser
  resourceRef:
    kind: IAMServiceAccount
    name: <gcp-service-account-name>

```