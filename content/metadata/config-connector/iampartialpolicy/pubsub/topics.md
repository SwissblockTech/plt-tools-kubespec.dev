---
title: IAMPartialPolicy on Pubsub topic
---

```yaml

apiVersion: iam.cnrm.cloud.google.com/v1beta1
kind: IAMPartialPolicy
metadata:
  name: <policy-name>
spec:
  resourceRef:
    apiVersion: pubsub.cnrm.cloud.google.com/v1beta1
    kind: PubSubTopic
    name: <pubsub-topic-name>
  bindings:
    - role: roles/pubsub.publisher
      members:
        - member: serviceAccount:<gcp-service-account-name>@<gcp-project-id>.iam.gserviceaccount.com
        - member: user:<user-email>

```