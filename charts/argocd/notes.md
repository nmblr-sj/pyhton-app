$ helm repo add argo https://argoproj.github.io/argo-helm
$ helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace -f values-argo.yaml