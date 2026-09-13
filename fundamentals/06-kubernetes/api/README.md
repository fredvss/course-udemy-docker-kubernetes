# API — Deployment e Service

Manifests da Joke API (FastAPI) no namespace `jokeapi`.

> Parte do módulo [06-kubernetes](../) do curso [Fundamentos](../../README.md).

## O que este módulo demonstra

- Deployment com imagem Docker da aplicação
- Variáveis de ambiente (`POSTGRES_URL`) apontando para o Service do banco
- Service NodePort para expor a API externamente

## Arquivos

| Arquivo | Recurso | Descrição |
|---------|---------|-----------|
| `api_deployment.yaml` | Deployment | Joke API FastAPI, 1 réplica |
| `api_service.yaml` | Service | NodePort, porta 8000 |
| `Dockerfile` | — | Build da imagem local |
| `src/main.py` | — | Código da API |

## Como executar

```bash
# Pré-requisitos: namespace, banco e imagem carregada no cluster
kubectl apply -f api_deployment.yaml
kubectl apply -f api_service.yaml
kubectl get deploy,svc -n jokeapi
```

## Fluxo

```text
Deployment → cria Pods da API
Service → expõe a API (NodePort)
Cliente → acessa via <NODE_IP>:<NODE_PORT>/joke/
```

## Integração com banco

```text
API Pod → joke-database-svc (ClusterIP) → Pod PostgreSQL → PVC → PV
```
