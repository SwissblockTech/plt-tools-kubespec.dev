---
title: Pubsub Subscription
---

```yaml

apiVersion: pubsub.cnrm.cloud.google.com/v1beta1
kind: PubSubSubscription
metadata:
  name: <subscription-name>
  ackDeadlineSeconds: 10
  messageRetentionDuration: 604800s
  resourceID:  <subscription-name>
  topicRef:
    name: <topic-ref-name>

```