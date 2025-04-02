# Install ARGOCD

$ helm repo add argo https://argoproj.github.io/argo-helm
$ helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace -f values-argo.yaml
$ kubectl get secrets argocd-initial-admin-secret -o yaml
$ echo "YXpSWUtTWHN0MG5oZVc0Qg==" | base64 -d #admin, azRYKSXst0nheW4B

values-argo.yaml
  redis-ha:
  enabled: false

  controller:
    replicas: 1

  server:
    replicas: 1

  repoServer:
    replicas: 1

  applicationSet:
    replicas: 1

  global:
    domain: argocd.test.com

  certificate:
    enabled: true

  server:
    ingress:
      annotations:
        nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
      enabled: true
      ingressClassName: nginx
      tls: true

# Install ARC / Action Runner Controller

https://github.com/actions/actions-runner-controller/blob/master/docs/quickstart.md

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml

helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller

helm upgrade --install --namespace actions-runner-system --create-namespace\
  --set=authSecret.create=true\
  --set=authSecret.github_token="REPLACE_YOUR_TOKEN_HERE"\
  --wait actions-runner-controller actions-runner-controller/actions-runner-controller

kubectl apply -f runnerdeployment.yaml -n actions-runner-system