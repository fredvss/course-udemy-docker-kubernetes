# 05 — Deployments

Deployments em profundidade: réplicas, labels, rollouts, escala, resources/limits, OOM, probes e variáveis de ambiente.

> Parte do curso [Kubernetes](../README.md).

## O que este módulo demonstra

- Deployment básico com réplicas e selector/labels
- Rollout, rollback e histórico de revisões
- Escalonamento manual de réplicas
- **Resources** — `requests` e `limits` (CPU/memória)
- **OOM** — comportamento quando o container excede o limit de memória
- **Probes** — `readinessProbe` e `livenessProbe`
- Variáveis de ambiente no Pod template

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `01-deployment.yaml` | Deployment nginx com 2 réplicas |
| `02-deployment-labels.yaml` | Labels adicionais no Deployment |
| `03-rollouts.txt` | Comandos de rollout (edit, undo, pause, restart) |
| `04-nginx-deployment-scale.yaml` | Escalonamento de réplicas |
| `05-deployment-resources/` | Resources + instalação do [Goldilocks](05-deployment-resources/README.md) |
| `06-oom.yaml` | Teste de OOM com limit de memória |
| `07-probes.yaml` | Readiness e liveness probes HTTP |
| `08-env-variables.yaml` | Variáveis de ambiente no container |

## Como executar

```bash
kubectl apply -f 01-deployment.yaml
kubectl get deployments,pods
kubectl rollout status deployment/nginx

# Rollouts (ver também 03-rollouts.txt)
kubectl rollout history deployment/nginx
kubectl rollout undo deployment/nginx

# Probes e env
kubectl apply -f 07-probes.yaml
kubectl apply -f 08-env-variables.yaml
kubectl exec <pod> -- env
```

## Diagrama

![Deployment e ReplicaSet](../docs/assets/04-deployment-replicaset.png)

## Próximo passo

[06-daemonsets](../06-daemonsets/) — DaemonSets para workloads por nó.
