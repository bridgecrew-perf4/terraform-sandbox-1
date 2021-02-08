.PHONY: cluster
export KIND_CLUSTER := simple
export KUBECONFIG := kube-config

cluster:
	kind get clusters | grep -q $(KIND_CLUSTER) || kind create cluster --kubeconfig $(KUBECONFIG) --name $(KIND_CLUSTER)

.PHONY: clean

clean:
	terraform destroy
	kind delete cluster --kubeconfig $(KUBECONFIG) --name $(KIND_CLUSTER)
	rm -f $(KUBECONFIG)
