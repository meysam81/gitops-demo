boostrap-cluster:
	@echo "Bootstrapping cluster..."
	@kind create cluster --config cluster/kind-config.yml

prepare-cluster:
	@kubectl apply -f cluster/flux-manifests.yml
	@kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/helm-chart-4.9.0/deploy/static/provider/kind/deploy.yaml
	@kubectl annotate ingressclass nginx ingressclass.kubernetes.io/is-default-class=true --overwrite
