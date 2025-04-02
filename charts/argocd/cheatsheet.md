$ helm repo add argo https://argoproj.github.io/argo-helm
$ helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace -f values-argo.yaml
$ kubectl get secrets argocd-initial-admin-secret -o yaml
$ echo "YXpSWUtTWHN0MG5oZVc0Qg==" | base64 -d #admin, azRYKSXst0nheW4B
