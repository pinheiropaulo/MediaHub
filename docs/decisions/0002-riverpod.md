# ADR 0002 — Riverpod para estado e dependências

- Status: Aceito
- Data: 2026-09-07

## Contexto

O aplicativo precisa representar sessão, busca, biblioteca e integrações assíncronas de forma testável.

## Decisão

Usar Riverpod para estado e composição de dependências, sem service locator adicional.

## Alternativas

- Estado local isolado não cobre dados compartilhados.
- Singletons manuais dificultam testes e ciclo de vida.
- Outro container aumentaria a quantidade de padrões.

## Consequências

Dependências podem ser sobrescritas em testes. Providers precisam permanecer pequenos e não depender de `BuildContext`.
