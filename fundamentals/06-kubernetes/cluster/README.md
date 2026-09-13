# Cluster — kind e Namespace

Configuração do cluster kind local e criação do namespace `jokeapi`.

> Parte do módulo [06-kubernetes](../) do curso [Fundamentos](../../README.md).

## O que este módulo demonstra

- Cluster kind com 1 control-plane + 2 workers
- `extraMounts` — montagem de diretório local nos workers para PV com `hostPath`
- Namespace dedicado para isolar os recursos da aplicação

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `config.yaml` | Cluster kind (control-plane + 2 workers com hostPath mount) |
| `create_namespace.yaml` | Namespace `jokeapi` |

## Como executar

Antes de criar o cluster, ajuste o `hostPath` em `config.yaml` para o caminho local do projeto na sua máquina:

```yaml
extraMounts:
  - hostPath: /seu/caminho/06-kubernetes/hostdir
    containerPath: /mnt/hostdir
```

Depois:

```bash
../create-volumes.sh
kind create cluster --config config.yaml --name jokeapi-cluster
kubectl apply -f create_namespace.yaml
kubectl get ns
```

## Fluxo

```text
config.yaml → kind create cluster → cluster local
create_namespace.yaml → kubectl apply → namespace jokeapi
```
