# ADR 0001 — Arquitetura feature-first pragmática

- Status: Aceito
- Data: 2026-09-07

## Contexto

O Media Hub integra diferentes catálogos e precisa manter regras pessoais independentes das APIs e da interface.

## Decisão

Organizar primeiro por funcionalidade, com presentation, domain e data criados conforme necessidade. Contratos de repository isolam infraestrutura.

## Alternativas

- Organização global por camada dispersa cada feature.
- Clean Architecture completa antecipa complexidade excessiva.
- Widgets acessando APIs misturam estado, regra e infraestrutura.

## Consequências

Features permanecem coesas e testáveis, com mapeamento adicional somente quando necessário.
