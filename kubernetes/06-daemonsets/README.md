# 06 — DaemonSets

DaemonSets garantem que um Pod rode em cada nó (ou em nós selecionados via `nodeSelector`).

> Parte do curso [Kubernetes](../README.md).

## O que este módulo demonstra

- DaemonSet com nginx em todos os nós elegíveis
- `nodeSelector` para restringir a nós específicos (ex: `worker-2`)
- Diferença entre Deployment (réplicas fixas) e DaemonSet (1 por nó)

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `daemonset.yaml` | DaemonSet nginx com nodeSelector em `worker-2` |

## Como executar

```bash
kubectl apply -f daemonset.yaml
kubectl get daemonsets
kubectl get pods -o wide
```

Verifique que um Pod foi criado apenas no nó `worker-2`.

## Diagrama

![DaemonSet](../docs/assets/07-daemonset.png)

## Próximo passo

[07-statefulsets](../07-statefulsets/) — StatefulSets, identidade estável e PDB.
