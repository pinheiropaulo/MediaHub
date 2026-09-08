# ADR 0004 — Mobile-first sem duplicação de layouts

- Status: Aceito
- Data: 2026-09-07

## Contexto

O MVP é Android. A estrutura anterior criava `MobileLayout` e `WebLayout` para a mesma página, duplicando composição e manutenção antes de existir demanda Web.

## Decisão

Implementar uma única página mobile por funcionalidade. Não criar pares de arquivos por plataforma durante o MVP.

A pasta técnica `web/` do Flutter pode permanecer, mas não determina a criação de layouts Web em `lib/`.

## Alternativas

- Manter dois layouts desde o início aumenta custo e divergência.
- Remover toda capacidade Web dificulta uma evolução futura sem trazer benefício imediato.

## Consequências

O código atual fica menor e alinhado ao produto. Quando Web for priorizada, a responsividade será reavaliada a partir de componentes compartilhados e necessidade real.
