---
title: IAMPartialPolicy on Pubsub subscription
---

```yaml

apiVersion: iam.cnrm.cloud.google.com/v1beta1
kind: IAMPartialPolicy
metadata:
  name: <policy-name>
spec:
  resourceRef:
    apiVersion: pubsub.cnrm.cloud.google.com/v1beta1
    kind: PubSubSubscription
    name: <pubsub-subscription-name>
  bindings:
    - role: roles/pubsub.subscriber
      members:
        - member: serviceAccount:<gcp-service-account-name>@<gcp-project-id>.iam.gserviceaccount.com
