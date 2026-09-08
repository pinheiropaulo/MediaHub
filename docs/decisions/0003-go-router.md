# ADR 0003 — Navegação declarativa com go_router

- Status: Aceito
- Data: 2026-09-07

## Contexto

O Media Hub precisa proteger rotas, restaurar sessão e aceitar deep links de autenticação e detalhes.

## Decisão

Usar `go_router` centralizado em `lib/app/router/`.

## Alternativas

- Navigator imperativo espalha regras de redirecionamento.
- Rotas manuais aumentam o trabalho para shell e deep links.

## Consequências

Sessão deve ser observável e independente do router. Rotas usam identificadores recuperáveis e sobreposições não viram páginas sem necessidade.
