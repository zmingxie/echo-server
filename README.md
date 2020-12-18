# echo-server

A simple Nginx + Lua echo server

## How to run

* Just as Docker container:
```
docker run -it --rm -p 8080:8080 -p 8443:8443 mxie/echo-server
```
* As a Kubernetes pod:
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: echo-server
  labels:
    app: echo-server
spec:
  template:
    metadata:
      labels:
        app: echo-server
    spec:
      containers:
      - name: echo-server
        image: mxie/echo-server
        resources:
          limits:
            cpu: "1"
            memory: "128Mi"
          requests:
            cpu:  "1"
            memory: "128Mi"
        ports:
        - name: http
          containerPort: 8080
        - name: https
          containerPort: 8443
        env:
          - name: NODE_NAME
            valueFrom:
              fieldRef:
                fieldPath: spec.nodeName
          - name: POD_NAME
            valueFrom:
              fieldRef:
                fieldPath: metadata.name
          - name: POD_NAMESPACE
            valueFrom:
              fieldRef:
                fieldPath: metadata.namespace
          - name: POD_IP
            valueFrom:
              fieldRef:
                fieldPath: status.podIP
```

## Sample Output

```
❯ curl http://localhost:8080

Hostname: ce6a4cc40a78

Server Info:
  nginx: 1.19.6
  lua:   10019

Pod Information:
  -* No pod information available *-

Request Information:
  client_address: 172.17.0.1
  method: GET
  real_path: /
  query:
  request_version: 1.1
  request_scheme: http
  request_uri: http://localhost:8080/

Request Headers:
  accept: */*
  host: localhost:8080
  user-agent: curl/7.64.1

Request Body:
  -* empty *-
```
