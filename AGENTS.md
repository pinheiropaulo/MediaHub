# Orientações para agentes

Estas instruções se aplicam a todo o repositório.

## Antes de alterar

1. Leia `README.md` e `docs/README.md`.
2. Consulte somente a documentação relacionada à tarefa.
3. Verifique o código, o estado do Git e os testes existentes.

## Regras obrigatórias

- O MVP atual é Android/mobile; não crie layouts Web nem duplique páginas por plataforma.
- Use arquitetura feature-first pragmática e respeite as dependências documentadas.
- Views não acessam APIs, Supabase ou repositories diretamente.
- Use Riverpod para estado e dependências e `go_router` para navegação.
- Código e nomes técnicos ficam em inglês; interface e documentação, em PT-BR.
- O nome visível do produto é sempre **Media Hub**.
- O MVP inclui filmes, séries e animes. Jogos e Steam são apenas evolução futura.
- Nunca exponha chaves, tokens, senhas ou dados pessoais em código, logs ou fixtures.
- Não adicione dependências sem justificar necessidade e impacto.
- Preserve mudanças locais e evite alterações não relacionadas.

## Validação

- Atualize documentação e testes junto com mudanças de comportamento.
- Não edite migrations aplicadas; crie uma nova migration.
- Antes de concluir, execute conforme o escopo:
  - `dart format --output=none --set-exit-if-changed .`
  - `flutter analyze`
  - `flutter test`
  - testes do Supabase quando houver mudança no banco.
- Se algum comando não puder ser executado, informe o motivo e o risco restante.
