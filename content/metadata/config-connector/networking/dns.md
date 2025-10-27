---
title: DNS Policy
---

```yaml

apiVersion: dns.cnrm.cloud.google.com/v1beta1
kind: DNSPolicy
metadata:
  name: <DNS_POLICY_NAME>
spec:
  alternativeNameServerConfig:
    targetNameServers:
      - ipv4Address: "<TARGET_DNS_IP>"
  description: "<DESCRIPTION>"
  enableInboundForwarding: <true_or_false>
  enableLogging: <true_or_false>
  networks:
    - networkRef:
        name: <NETWORK_NAME>
```