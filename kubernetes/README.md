# Curso Kubernetes — Udemy

Material prático de Kubernetes: provisionamento de clusters (kind e kubeadm), manifests YAML e workloads — Deployments, DaemonSets, StatefulSets, CronJobs, Services, estratégias de deploy e Ingress.

> Parte do monorepo [Udemy — Docker & Kubernetes](../README.md). Para bases de Docker e um deploy introdutório com kind, veja [`fundamentals/`](../fundamentals/) (módulo 06).

## Pré-requisitos

| Requisito | Módulos |
|-----------|---------|
| [Docker Engine](https://docs.docker.com/engine/install/) | kind |
| [kind](https://kind.sigs.k8s.io/) + [kubectl](https://kubernetes.io/docs/tasks/tools/) | kind, kubeadm |
| [Vagrant](https://www.vagrantup.com/) + [VirtualBox](https://www.virtualbox.org/) (~6 GB RAM) | kubeadm |
| Conhecimento básico de Docker e YAML | todos |

## Estrutura do repositório

| Pasta | Tema | Documentação |
|-------|------|--------------|
| [`01-provisioning/kind`](01-provisioning/kind/) | Cluster local com kind (multi-node, port mappings) | [README](01-provisioning/kind/README.md) |
| [`01-provisioning/kubeadm`](01-provisioning/kubeadm/) | Cluster kubeadm com Vagrant (1 master + 2 workers, Flannel) | [README](01-provisioning/kubeadm/README.md) |
| [`02-yaml`](02-yaml/) | Manifests YAML básicos | [README](02-yaml/README.md) |
| [`03-namespace`](03-namespace/) | Namespaces | [README](03-namespace/README.md) |
| [`04-pod`](04-pod/) | Pods — init, multi-container, lifecycle, static | [README](04-pod/README.md) |
| [`05-deployment`](05-deployment/) | Deployments — rollouts, probes, resources, OOM | [README](05-deployment/README.md) |
| [`06-daemonsets`](06-daemonsets/) | DaemonSets | [README](06-daemonsets/README.md) |
| [`07-statefulsets`](07-statefulsets/) | StatefulSets e PodDisruptionBudget | [README](07-statefulsets/README.md) |
| [`08-cronjobs`](08-cronjobs/) | Jobs e CronJobs | [README](08-cronjobs/README.md) |
| [`09-services`](09-services/) | ClusterIP, NodePort, LoadBalancer, Headless, MetalLB | [README](09-services/README.md) |
| [`10-deployment-strategies`](10-deployment-strategies/) | Blue-green e canary | [README](10-deployment-strategies/README.md) |
| [`11-ingress`](11-ingress/) | Ingress _(manifests em construção)_ | [README](11-ingress/README.md) |

## Documentação

Índice completo em **[docs/README.md](docs/)** — diagramas de arquitetura em [`docs/assets/`](docs/assets/).

## Ordem sugerida

```text
01-provisioning/kind          → cluster rápido para testes locais
        ↓
01-provisioning/kubeadm       → cluster “de produção” com VMs
        ↓
02-yaml                       → manifests e recursos básicos
        ↓
03-namespace                  → isolamento lógico com Namespaces
        ↓
04-pod                        → Pods, containers e ciclo de vida
        ↓
05-deployment                 → Deployments, rollouts e probes
        ↓
06-daemonsets                 → workload por nó
        ↓
07-statefulsets               → identidade estável e PDB
        ↓
08-cronjobs                   → tarefas batch agendadas
        ↓
09-services                   → exposição e descoberta de serviços
        ↓
10-deployment-strategies      → blue-green e canary
        ↓
11-ingress                    → roteamento HTTP/HTTPS
```

## Quick start — kind

```bash
kind create cluster --config kubernetes/01-provisioning/kind/config.yaml
kubectl cluster-info --context kind-kind
kubectl get nodes
```

## Quick start — kubeadm (Vagrant)

```bash
cd kubernetes/01-provisioning/kubeadm
vagrant up
vagrant ssh master-1
kubectl get nodes -o wide
```

→ Detalhes, troubleshooting e IPs fixos: [01-provisioning/kubeadm/README.md](01-provisioning/kubeadm/README.md)

## Relação com `fundamentals/06-kubernetes`

O módulo [`fundamentals/06-kubernetes`](../fundamentals/06-kubernetes/) aplica a Joke API (FastAPI + PostgreSQL) em um cluster kind com PV, Services e CronJob — um projeto integrado de ponta a ponta.

Este curso (`kubernetes/`) foca em conceitos e operação de cluster de forma mais ampla, com provisionamento real via kubeadm e exercícios incrementais de YAML.

## Licença

Material de estudo pessoal — use livremente para aprendizado.
