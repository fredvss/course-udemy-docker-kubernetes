# PostgreSQL — Deployment, PV/PVC e Service

Manifests do banco PostgreSQL com persistência via PersistentVolume.

> Parte do módulo [06-kubernetes](../) do curso [Fundamentos](../../README.md).

## O que este módulo demonstra

- Deployment com volume montado via PVC
- PersistentVolume (`hostPath`) + PersistentVolumeClaim
- Service ClusterIP para comunicação interna

## Arquivos

| Arquivo | Recurso | Descrição |
|---------|---------|-----------|
| `database_deployment.yaml` | Deployment | PostgreSQL 16 com credenciais via env |
| `database_pv_pvc.yaml` | PV + PVC | 1Gi, `storageClassName: manual` |
| `database_service.yaml` | Service | ClusterIP, porta 5432 |

## Como executar

```bash
kubectl apply -f database_pv_pvc.yaml
kubectl apply -f database_deployment.yaml
kubectl apply -f database_service.yaml
kubectl get pv,pvc,deploy,svc -n jokeapi
```

## Fluxo de storage

```text
Pod PostgreSQL
      ↓ volumeMount
PVC (postgres-pvc)
      ↓ bind
PV (hostPath /mnt/hostdir/postgresql)
      ↓
Disco local (kind extraMounts)
```

## Observação

As credenciais (`admin123`) estão hardcoded por ser ambiente de estudo. Em produção, use **Kubernetes Secrets**.
