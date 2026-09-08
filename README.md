# Media Hub

Aplicativo pessoal para descobrir, organizar e acompanhar filmes, séries e animes em uma única biblioteca.

O MVP é desenvolvido em Flutter para Android, com interface em PT-BR. TMDB fornece filmes e séries, AniList fornece animes e Supabase gerencia autenticação e dados pessoais.

## Objetivo do MVP

- Criar e acessar uma conta.
- Descobrir e buscar filmes, séries e animes.
- Adicionar conteúdos à biblioteca pessoal.
- Acompanhar situação, temporadas e episódios.
- Consultar estatísticas e preferências básicas.

Jogos e integração com Steam estão planejados somente para uma etapa futura.

Consulte o [escopo completo do MVP](docs/product/mvp-scope.md).

## Stack

- Flutter e Dart.
- Material 3.
- Riverpod.
- `go_router`.
- Dio.
- Supabase.
- TMDB e AniList GraphQL.

## Executar localmente

```sh
flutter pub get
flutter analyze
flutter test
flutter run
```

Veja [Preparação do ambiente](docs/development/getting-started.md). Credenciais reais e segredos não devem ser versionados.

## Arquitetura

O projeto adota organização feature-first com separação pragmática entre apresentação, domínio e dados:

```text
View -> Provider/ViewModel -> domínio <- repository <- data source
```

- [Visão geral](docs/architecture/overview.md)
- [Estrutura de pastas](docs/architecture/folder-structure.md)
- [Navegação](docs/architecture/navigation.md)

## Documentação

O índice completo está em [docs/README.md](docs/README.md).

- [Produto e escopo](docs/product/mvp-scope.md)
- [Regras de negócio](docs/product/business-rules.md)
- [Modelo de dados](docs/backend/database.md)
- [Fontes de dados](docs/backend/data-sources.md)
- [Design System](docs/design/design-system.md)
- [Inventário de telas](docs/design/screen-inventory.md)
- [Roadmap](docs/product/roadmap.md)
- [Como desenvolver](CONTRIBUTING.md)
- [Changelog](CHANGELOG.md)

## Estado atual

- [x] Projeto Flutter criado.
- [x] Escopo e Design System definidos.
- [x] Documentação modular criada.
- [x] Login e Início mobile consolidados.
- [x] Riverpod e router iniciais configurados.
- [ ] Estrutura feature-first final.
- [ ] Navegação completa.
- [ ] Integração com Supabase, TMDB e AniList.
- [ ] Funcionalidades e testes do MVP.

## Uso

Projeto pessoal e privado.
