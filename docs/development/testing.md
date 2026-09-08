# Estratégia de testes

## Prioridades

- Regras de situação e progresso.
- Mappers do TMDB e AniList.
- Providers e estados assíncronos.
- Repositories.
- Redirecionamentos de autenticação.
- Widgets críticos de Login, Busca e Biblioteca.
- RLS e isolamento entre usuários.

## Níveis

- Unitários para domínio, mappers e providers.
- Widgets para estados e interação.
- Integração para repositories e autenticação.
- SQL para constraints e políticas.
- End-to-end somente para fluxos essenciais.

## Comandos

```sh
flutter test
flutter test --coverage
```

O projeto ainda precisa criar sua estrutura inicial em `test/`.
