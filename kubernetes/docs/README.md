# Documentação — Kubernetes

Material de apoio ao [curso Kubernetes](../README.md). Os exercícios práticos ficam nas pastas numeradas; aqui ficam diagramas e recursos de referência.

## Diagramas

Assets em [`assets/`](assets/):

| Arquivo | Conteúdo |
|---------|----------|
| `01-kubernetes-architecture.png` | Visão geral da arquitetura |
| `02-detailed-data-plane.png` | Data plane detalhado |
| `03-detailed-pod.png` | Anatomia de um Pod |
| `04-deployment-replicaset.png` | Deployment e ReplicaSet |
| `05-deployment-resources.png` | Requests, limits e sizing |
| `06-probes.png` | Readiness e liveness probes |
| `07-daemonset.png` | DaemonSet |
| `08-statefulset.png` | StatefulSet |
| `09-pdb.png` | PodDisruptionBudget |
| `10-cronjob.png` | CronJob |
| `11-services.png` | Tipos de Service |
| `12-traffic-policy.png` | External traffic policy |
| `13-deploy-strategies.png` | Blue-green e canary |
| `14-ingress.png` | Ingress |

## Documentação nos módulos

| Módulo | Tópico |
|--------|--------|
| [01-provisioning/kind](../01-provisioning/kind/) | Cluster local com kind |
| [01-provisioning/kubeadm](../01-provisioning/kubeadm/) | Cluster kubeadm + Vagrant |
| [05-deployment/05-deployment-resources](../05-deployment/05-deployment-resources/) | Goldilocks — sizing de requests/limits |

## Projeto integrado

Para um deploy completo de ponta a ponta (API + PostgreSQL + CronJob), veja [`fundamentals/06-kubernetes`](../../fundamentals/06-kubernetes/).
