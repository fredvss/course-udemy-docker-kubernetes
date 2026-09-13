# kind — Cluster local multi-node

Configuração de um cluster Kubernetes local com [kind](https://kind.sigs.k8s.io/): 1 control-plane com port mappings para Ingress e 3 workers.

> Parte do módulo [01-provisioning](../) do curso [Kubernetes](../../README.md).

## O que este módulo demonstra

- Cluster multi-node em containers Docker
- `extraPortMappings` no control-plane (80, 443, 8080) para expor Ingress/LoadBalancer
- Label `ingress-ready=true` no kubelet para controllers de Ingress

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `config.yaml` | Definição do cluster kind (1 control-plane + 3 workers) |

## Como executar

```bash
kind create cluster --config config.yaml
kubectl cluster-info --context kind-kind
kubectl get nodes -o wide
```

Para deletar:

```bash
kind delete cluster --name kind
```

## Próximo passo

[kubeadm](../kubeadm/) — cluster com VMs reais via Vagrant, ou avance para [02-yaml](../../02-yaml/).
