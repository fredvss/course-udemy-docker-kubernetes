# Goldilocks — sizing de requests/limits

[Goldilocks](https://goldilocks.docs.fairwinds.com/) analisa o consumo real de recursos dos Pods e sugere valores ideais de `requests` e `limits` via dashboard web.

> Submódulo de [05-deployment](../) — complementa `06-oom.yaml` e `nginx-deployment-resources.yaml`.

## Pré-requisitos

- Cluster Kubernetes funcional
- [Helm](https://helm.sh/) instalado

## Instalação

### 1. Adicionar o repositório Helm

```bash
helm repo add fairwinds-stable https://charts.fairwinds.com/stable
helm repo update
```

### 2. Instalar o Goldilocks (com VPA embutido)

```bash
helm install goldilocks fairwinds-stable/goldilocks \
  --namespace goldilocks \
  --create-namespace \
  -f values.yaml
```

Aguarde os pods ficarem `Running`:

```bash
kubectl get pods -n goldilocks
```

### 3. Habilitar monitoramento em um namespace

```bash
kubectl label ns default goldilocks.fairwinds.com/enabled=true
```

### 4. Acessar o dashboard

```bash
kubectl -n goldilocks port-forward svc/goldilocks-dashboard 8080:80
```

Acesse: http://localhost:8080

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `values.yaml` | Configuração Helm do Goldilocks |
| `nginx-deployment-resources.yaml` | Deployment nginx com requests/limits para análise |

## Desinstalação

```bash
helm uninstall goldilocks -n goldilocks
kubectl delete namespace goldilocks
kubectl label ns default goldilocks.fairwinds.com/enabled-
```

## Referências

- [Documentação oficial](https://goldilocks.docs.fairwinds.com/installation/#installation-2)
- [Helm chart](https://artifacthub.io/packages/helm/fairwinds-stable/goldilocks)
