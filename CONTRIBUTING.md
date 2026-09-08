# Desenvolvimento do Media Hub

## Antes de começar

Leia:

- [Documentação](docs/README.md)
- [Arquitetura](docs/architecture/overview.md)
- [Padrões de código](docs/development/code-style.md)
- [Fluxo Git](docs/development/git-workflow.md)

## Princípios

- Faça mudanças pequenas e focadas.
- Não duplique telas por plataforma durante o MVP mobile.
- Respeite as dependências entre apresentação, domínio e dados.
- Atualize testes e documentação com o comportamento.
- Não inclua segredos nem dados pessoais reais.

## Verificação

```sh
dart format .
flutter analyze
flutter test
```

## Definição de pronto

Uma mudança está pronta quando:

- atende ao comportamento esperado;
- cobre loading, vazio e erro quando aplicável;
- preserva acessibilidade;
- possui testes proporcionais ao risco;
- não introduz avisos de análise;
- atualiza a documentação responsável;
- não expõe segredos.
