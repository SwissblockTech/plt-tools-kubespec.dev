---
title: A Stateful set example. Note for a statefulset requires a headless service
---

```yaml
apiVersion: v1
kind: Service
metadata:
  name: <your-app>-headless
spec:
  clusterIP: None
  selector:
    app: <your-app>
  ports:
    - name: <main-port-name>
      port: <main-port>
      targetPort: <main-port-name>
```

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: <your-app>
spec:
  serviceName: <your-app>-headless
  replicas: 1
  selector:
    matchLabels:
      app: <your-app>
  template:
    metadata:
      labels:
        app: <your-app>
    spec:
      securityContext:
        runAsNonRoot: true
        runAsUser: 1001
        runAsGroup: 1001
        fsGroup: 1001
      containers:
        - name: <main-container-name>
          image: <main-image>
          imagePullPolicy: IfNotPresent
          envFrom:
            - configMapRef:
                name: <your-app>
            - secretRef:
                name: <your-app>
          ports:
            - name: <main-port-name>
              containerPort: <main-port>
          resources:
            requests:
              cpu: 1
              memory: 512Mi
            limits:
              cpu: 1
              memory: 512Mi
          livenessProbe:
            exec:
              command:
                .........
            initialDelaySeconds: 30
            periodSeconds: 10
            timeoutSeconds: 5
            successThreshold: 1
            failureThreshold: 6
          readinessProbe:
            exec:
              command:
               ..........
            initialDelaySeconds: 5
            periodSeconds: 10
            timeoutSeconds: 5
            successThreshold: 1
            failureThreshold: 6
          securityContext:
            privileged: false
            allowPrivilegeEscalation: false
            capabilities:
              drop:
                - ALL
            readOnlyRootFilesystem: true
          volumeMounts:
            - name: <volume-name>
              mountPath: <data-mount-path>
      nodeSelector:
        kubernetes.io/os: linux
      tolerations:
        - key: dedicated
          operator: Equal
          value: <toleration-value>
          effect: NoSchedule
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
              - matchExpressions:
                  - key: dedicated
                    operator: In
                    values:
                      - <node-label-value>
  volumeClaimTemplates:
    - apiVersion: v1
      kind: PersistentVolumeClaim
      metadata:
        name: <volume-name>
        labels:
          type: ssd
          expandable: "true"
      spec:
        storageClassName: <storage-class>
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: <data-size>
```