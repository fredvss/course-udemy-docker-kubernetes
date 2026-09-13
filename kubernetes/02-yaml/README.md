# 02 — Manifests YAML básicos

Primeiro contato com manifests Kubernetes: estrutura de um Pod mínimo e comandos `kubectl apply`.

> Parte do curso [Kubernetes](../README.md).

## O que este módulo demonstra

- Estrutura básica de um manifest: `apiVersion`, `kind`, `metadata`, `spec`
- Pod com container nginx e `containerPort`
- Labels para identificação de recursos

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `pod.yaml` | Pod nginx simples no namespace `default` |

## Como executar

```bash
kubectl apply -f pod.yaml
kubectl get pods
kubectl describe pod nginx
kubectl delete -f pod.yaml
```

## Próximo passo

[03-namespace](../03-namespace/) — isolamento lógico com Namespaces.
