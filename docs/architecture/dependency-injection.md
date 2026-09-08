# Injeção de dependências

## Decisão

Riverpod compõe dependências. Não será usado service locator adicional.

## Composição

```text
configuração -> cliente -> data source -> repository -> caso de uso/provider
```

## Regras

- Uma instância configurada por cliente externo.
- Dependências concretas ficam próximas à composição do aplicativo.
- Domínio conhece contratos, não SDKs.
- Providers podem ser sobrescritos em testes.
- Não criar singleton global manual.

## Ambientes

URLs e chaves públicas vêm da configuração do ambiente. Segredos server-side nunca entram no Flutter.
