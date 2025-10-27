---
title: ClusterWorkfflow template with Steps
---

```
apiVersion: argoproj.io/v1alpha1
kind: ClusterWorkflowTemplate
metadata:
  name: <cwt-name>
spec:
  serviceAccountName: <sa-name>
  entrypoint: main
  arguments:
    parameters:
      - name: repo_url
      - name: repo_name
      - name: repo_org
      - name: branch
      - name: commit_sha
      - name: is_tag
      - name: context_path
      - name: container_image_registry
      - name: container_image_tag
      - name: root_path
        value: /go
      - name: base_path
        value: /go/src/app/
      - name: dockerfile_path
        value: Dockerfile
  templates:
    - name: main
      inputs:
        parameters:
          - name: repo_url
          - name: repo_name
          - name: repo_org
          - name: branch
          - name: commit_sha
          - name: is_tag
          - name: root_path
          - name: base_path
          - name: context_path
          - name: dockerfile_path
          - name: container_image_registry
          - name: container_image_tag
      steps:
        - - name: clone-code
            templateRef:
              name: <git-clone-template-name>
              template: <git-clone-template-name>
              clusterScope: true
            arguments:
              parameters:
                - name: repo_url
                  value: "{{inputs.parameters.repo_url}}"
                - name: context_path
                  value: "{{inputs.parameters.context_path}}"
                - name: root_path
                  value: "{{inputs.parameters.root_path}}"
                - name: base_path
                  value: "{{inputs.parameters.base_path}}"
                - name: branch
                  value: "{{inputs.parameters.branch}}"
                - name: git_opts
                  value: "--depth=1 --single-branch"

        - - name: build-code
            templateRef:
              name: <build-template-name>
              template: <build-template-name>
              clusterScope: true
            arguments:
              parameters:
                - name: context_path
                  value: "{{inputs.parameters.context_path}}"
                - name: root_path
                  value: "{{inputs.parameters.root_path}}"
                - name: base_path
                  value: "{{inputs.parameters.base_path}}"

        - - name: build-container-image
            templateRef:
              name: <kaniko-build-template-name>
              template: <kaniko-build-template-name>
              clusterScope: true
            arguments:
              parameters:
                - name: context_path
                  value: "{{inputs.parameters.context_path}}"
                - name: root_path
                  value: "{{inputs.parameters.root_path}}"
                - name: base_path
                  value: "{{inputs.parameters.base_path}}"
                - name: commit_sha
                  value: "{{inputs.parameters.commit_sha}}"
                - name: dockerfile_path
                  value: "{{inputs.parameters.dockerfile_path}}"
                - name: container_image_registry
                  value: "{{inputs.parameters.container_image_registry}}"
                - name: container_image_tag
                  value: "{{inputs.parameters.container_image_tag}}"
```
