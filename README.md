# MediaHub

Aplicativo pessoal multiplataforma (Mobile e Web) para centralizar e organizar conteúdos de entretenimento: filmes, séries, animes e jogos[cite: 4].

## Visão Geral
O projeto consolida dados de múltiplas fontes externas em uma única biblioteca pessoal[cite: 4]. O foco é separar o que é "catálogo público" do que é a "relação do usuário com o conteúdo", permitindo o acompanhamento de progresso, registro de notas e gerenciamento de status de consumo (Planejado, Assistindo/Jogando, Pausado, Concluído, Abandonado)[cite: 4].

## Tecnologias Principais
* **Frontend:** Flutter, Riverpod (Estado), GoRouter (Navegação)[cite: 4].
* **Backend:** Supabase (PostgreSQL, Autenticação, Edge Functions)[cite: 4].
* **Integração e Rede:** Dio (HTTP), APIs REST (TMDB, Steam) e GraphQL (AniList)[cite: 4].

## Documentação de Engenharia (`docs/`)
A lógica de negócios e as regras de integração foram desacopladas. Consulte os documentos abaixo para especificações arquiteturais:

* **[Arquitetura e Padrões](docs/ARCHITECTURE.md):** Diretrizes de estruturação Feature-first, Clean Architecture, injeção de dependências e organização de componentes[cite: 4].
* **[Fontes de Dados (APIs)](docs/DATA_SOURCES.md):** Regras de integração, mapeamento de domínios e consumo da Steam Web API, TMDB e AniList[cite: 4].
* **[Esquema de Banco de Dados](docs/DATABASE_SCHEMA.md):** Estrutura das tabelas principais (`media`, `user_media`, `media_progress`) e persistência no Supabase[cite: 4].
