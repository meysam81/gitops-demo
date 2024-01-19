boostrap-cluster:
	@echo "Bootstrapping cluster..."
	@kind create cluster --config cluster/kind-config.yml

prepare-cluster:
	@kubectl apply -f cluster/flux-manifests.yml
	@kubectl apply -f cluster/contour.yml
