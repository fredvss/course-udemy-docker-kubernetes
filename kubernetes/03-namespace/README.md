# 03 — Namespaces

Isolamento lógico de recursos com Namespaces: criar um namespace dedicado e executar Pods nele.

> Parte do curso [Kubernetes](../README.md).

## O que este módulo demonstra

- Criação de Namespace customizado
- Execução de Pods em namespace específico via `metadata.namespace`
- Comandos `kubectl` com flag `-n`

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `namespace.yaml` | Namespace `learning` |
| `pod.yaml` | Pod de exemplo no namespace `learning` |

## Como executar

```bash
kubectl apply -f namespace.yaml
kubectl apply -f pod.yaml
kubectl get pods -n learning
kubectl get namespaces
```

Definir namespace padrão no contexto:

```bash
kubectl config set-context --current --namespace=learning
```

## Próximo passo

[04-pod](../04-pod/) — Pods em detalhe: init containers, multi-container, lifecycle e static pods.
