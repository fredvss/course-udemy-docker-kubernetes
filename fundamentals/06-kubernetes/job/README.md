# CronJob — Request New Joke

CronJob que busca piadas na [Chuck Norris API](https://api.chucknorris.io/) e grava no PostgreSQL a cada minuto.

> Parte do módulo [06-kubernetes](../) do curso [Fundamentos](../../README.md).

## O que este módulo demonstra

- **CronJob** — agendamento com expressão cron (`* * * * *`)
- Job batch que executa e termina (`restartPolicy: OnFailure`)
- Comunicação com o banco via DNS interno (`joke-database-svc`)
- Limites de histórico (`successfulJobsHistoryLimit`, `failedJobsHistoryLimit`)

## Arquivos

| Arquivo | Recurso | Descrição |
|---------|---------|-----------|
| `job_request_new_joke.yaml` | CronJob | Disparo a cada minuto |
| `Dockerfile` | — | Build da imagem do job |
| `src/main.py` | — | Script que busca e insere piadas |

## Como executar

```bash
kubectl apply -f job_request_new_joke.yaml
kubectl get cronjobs,jobs,pods -n jokeapi
kubectl logs job/<job-name> -n jokeapi
```

## Fluxo

```text
CronJob (a cada 1 min)
   ↓
Job → Pod
   ↓
GET Chuck Norris API → INSERT PostgreSQL
```

## Diferença vs Deployment

| Deployment | CronJob |
|------------|---------|
| Sempre rodando | Executa e termina |
| Apps web/API | Tarefas batch |
| Escala contínua | Agendamento periódico |
