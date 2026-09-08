# Critérios de qualidade

## Obrigatórios

```sh
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

## Interface

- Estados aplicáveis implementados.
- Texto funciona com escala ampliada.
- Toque, semântica, teclado e safe areas revisados.
- Informação não depende apenas de cor.

## Segurança

- Nenhum segredo ou dado pessoal no diff.
- Logs revisados.
- Autorização validada no backend.
- RLS testada quando houver banco.

## Documentação

Mudanças de arquitetura, produto, setup ou banco atualizam a fonte oficial. Decisões difíceis de reverter recebem ADR.

## Exceções

Qualquer validação não executada deve ser informada com motivo e risco restante.
