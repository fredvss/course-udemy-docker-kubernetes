# 04 — Pods em detalhe

Exercícios progressivos sobre Pods: comandos customizados, init containers, multi-container, static pods e lifecycle hooks.

> Parte do curso [Kubernetes](../README.md).

## O que este módulo demonstra

- `command` e `args` para sobrescrever o entrypoint do container
- **Init containers** — executam antes do container principal (ex: wait-for-dns)
- **Multi-container** — vários containers no mesmo Pod
- **Static pods** — gerenciados diretamente pelo kubelet
- **Lifecycle hooks** — `postStart` e `preStop`

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `01-pod-command.yaml` | Pod com `command` customizado (sleep) para `kubectl exec` |
| `02-init-container.yaml` | Init container aguardando serviço DNS |
| `03-multi-container.yaml` | Pod com httpd + alpine sidecar |
| `04-static-pod.yaml` | Static pod via manifest no kubelet |
| `05-lifecycle.yaml` | Hooks de lifecycle no container |

## Como executar

```bash
kubectl apply -f 01-pod-command.yaml
kubectl exec -it terraform-demo -- /bin/sh

kubectl apply -f 02-init-container.yaml
# Criar o serviço que o init aguarda:
kubectl create service mymysql --tcp=80:80

kubectl apply -f 03-multi-container.yaml
kubectl apply -f 05-lifecycle.yaml
```

## Diagrama

![Pod detalhado](../docs/assets/03-detailed-pod.png)

## Próximo passo

[05-deployment](../05-deployment/) — Deployments, ReplicaSets, rollouts e probes.
