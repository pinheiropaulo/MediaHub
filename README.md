# MediaHub

Aplicativo pessoal para centralizar e organizar conteúdos de entretenimento em um único lugar: **filmes, séries, animes e jogos**.

A proposta combina uma experiência de acompanhamento inspirada em aplicativos como TV Time com uma biblioteca pessoal unificada. O usuário poderá pesquisar conteúdos, acompanhar progresso, favoritar, avaliar, criar listas, consultar detalhes e sincronizar dados da conta Steam.

O projeto será desenvolvido em **Flutter/Dart**, utilizando **Riverpod** para gerenciamento de estado e injeção de dependências, **Dio** para comunicação HTTP, **Supabase** para persistência/sincronização e a **Steam Web API** como integração de jogos.

---

## 1. Objetivo do projeto

O MediaHub tem como objetivo ser um agregador pessoal de entretenimento, reunindo em uma única aplicação conteúdos provenientes de diferentes fontes.

Tipos de conteúdo:

- Filmes
- Séries
- Animes
- Jogos

Principais funcionalidades planejadas:

- Pesquisa global de conteúdos.
- Visualização de detalhes.
- Biblioteca pessoal.
- Lista de desejos/backlog.
- Favoritos.
- Avaliação pessoal.
- Status de acompanhamento.
- Progresso de séries e animes.
- Registro de tempo de jogo.
- Histórico de atividades.
- Estatísticas pessoais.
- Sincronização entre dispositivos através do Supabase.
- Sincronização opcional da conta Steam.

---

## 2. Stack principal

### Framework

- Flutter
- Dart

### Estado e injeção de dependências

- `flutter_riverpod`
- `riverpod_annotation`

### Comunicação HTTP

- `dio`

### Configuração

- `flutter_dotenv`

### Imagens

- `cached_network_image`

### Tipografia

- `google_fonts`

### Backend / persistência

- `supabase_flutter`
- Supabase PostgreSQL
- Supabase Auth
- Supabase Edge Functions

### Navegação

- `go_router`

### Serialização

- `json_annotation`
- `json_serializable`
- `build_runner`

---

## 3. Fontes de dados

### TMDB

O **The Movie Database (TMDB)** será a principal fonte de dados para filmes e séries.

Usos previstos:

- Busca de filmes.
- Busca de séries.
- Busca global.
- Detalhes de filmes.
- Detalhes de séries.
- Elenco e informações relacionadas.
- Gêneros.
- Datas de lançamento.
- Avaliações.
- Pôsteres.
- Backdrops.
- Conteúdos populares/trending.

Documentação:

https://developer.themoviedb.org/

---

### AniList

O **AniList** será utilizado como fonte de dados para animes.

Usos previstos:

- Busca de anime.
- Detalhes.
- Gêneros.
- Sinopse.
- Temporadas.
- Episódios.
- Avaliações.
- Imagens.
- Status.
- Informações de lançamento.
- Conteúdos em destaque/trending.

A API do AniList utiliza **GraphQL**.

Documentação:

https://anilist.gitbook.io/anilist-apiv2-docs/

---

### Steam

A **Steam será a única plataforma de jogos integrada inicialmente**.

Ela terá dois papéis no projeto:

#### Catálogo de jogos

Permitir pesquisar jogos mesmo quando o usuário ainda não os possui.

Exemplo:

```text
Elden Ring
Cyberpunk 2077
Baldur's Gate 3
Hades
```

#### Sincronização da conta

Quando configurada, a aplicação poderá sincronizar os dados disponíveis da conta Steam, como:

- Jogos possuídos.
- Steam App ID.
- Nome dos jogos.
- Tempo total jogado.
- Tempo jogado recentemente.
- Jogos jogados recentemente.
- Outros dados disponibilizados pela Steam Web API.

Interface principal de interesse:

```text
IPlayerService
```

Métodos relevantes para o projeto:

- `GetOwnedGames`
- `GetRecentlyPlayedGames`
- `GetSingleGamePlaytime`

Documentação:

https://partner.steamgames.com/doc/webapi/IPlayerService

### Decisão sobre outras plataformas

Epic Games, GOG, Ubisoft Connect e EA não farão parte do MVP.

A arquitetura poderá ser expandida futuramente, mas o projeto não dependerá dessas plataformas na primeira versão.

---

## 4. Conceito importante: catálogo x biblioteca pessoal

O aplicativo não deve confundir o conteúdo disponível em uma API externa com aquilo que o usuário possui ou acompanha.

Por exemplo:

```text
Cyberpunk 2077

Catálogo:
✓ Existe

Steam:
✓ Possuo

Minha biblioteca:
✓ Jogando

Favorito:
✓ Sim

Nota:
9/10
```

Outro exemplo:

```text
Baldur's Gate 3

Catálogo:
✓ Existe

Steam:
✗ Ainda não possuo

Minha biblioteca:
✓ Planejado

Lista de desejos:
✓ Sim
```

Portanto, o catálogo e a relação do usuário com o conteúdo serão modelos separados.

---

# 5. Arquitetura

A arquitetura seguirá uma abordagem **Feature-first + Clean Architecture simplificada**.

Objetivos:

- Manter a UI independente das APIs.
- Manter o domínio independente das fontes externas.
- Centralizar acesso a dados em repositories.
- Isolar integrações externas.
- Utilizar Riverpod para estado e injeção de dependências.
- Utilizar Supabase para os dados persistentes do usuário.
- Permitir substituição ou expansão de fontes no futuro.

Fluxo geral:

```text
UI
 │
 ▼
Riverpod
 │
 ▼
Repository
 │
 ├── TMDB
 ├── AniList
 ├── Steam
 └── Supabase
 │
 ▼
Domain Entities
 │
 ▼
Estado / Persistência
```

As respostas das APIs não devem chegar diretamente à UI.

Fluxo esperado:

```text
API
 ↓
DTO / Model
 ↓
Mapper
 ↓
Domain Entity
 ↓
Riverpod
 ↓
UI
```

---

# 6. Estrutura de pastas

```text
lib/
│
├── app/
│   ├── app.dart
│   ├── router.dart
│   │
│   └── theme/
│       ├── app_theme.dart
│       ├── app_colors.dart
│       └── app_text_styles.dart
│
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   └── app_constants.dart
│   │
│   ├── errors/
│   │   ├── app_exception.dart
│   │   └── failure.dart
│   │
│   ├── network/
│   │   ├── dio_provider.dart
│   │   ├── network_interceptor.dart
│   │   └── network_exception.dart
│   │
│   ├── utils/
│   │   ├── date_utils.dart
│   │   ├── duration_utils.dart
│   │   └── string_utils.dart
│   │
│   └── components/
│       ├── app_error.dart
│       ├── app_loading.dart
│       └── poster_card.dart
│
├── domain/
│   ├── entities/
│   │   ├── media_item.dart
│   │   ├── movie.dart
│   │   ├── series.dart
│   │   ├── anime.dart
│   │   └── game.dart
│   │
│   └── enums/
│       ├── media_type.dart
│       ├── media_source.dart
│       └── media_status.dart
│
├── data/
│   ├── repositories/
│   │   ├── movie_repository.dart
│   │   ├── series_repository.dart
│   │   ├── anime_repository.dart
│   │   └── game_repository.dart
│   │
│   └── local/
│       └── cache/
│
├── services/
│   ├── tmdb/
│   │   ├── tmdb_api.dart
│   │   ├── tmdb_models.dart
│   │   ├── tmdb_mapper.dart
│   │   └── tmdb_repository.dart
│   │
│   ├── anilist/
│   │   ├── anilist_api.dart
│   │   ├── anilist_models.dart
│   │   ├── anilist_queries.dart
│   │   ├── anilist_mapper.dart
│   │   └── anilist_repository.dart
│   │
│   ├── steam/
│   │   ├── steam_api.dart
│   │   ├── steam_models.dart
│   │   ├── steam_mapper.dart
│   │   ├── steam_repository.dart
│   │   └── steam_sync_service.dart
│   │
│   └── supabase/
│       ├── supabase_client.dart
│       ├── supabase_repository.dart
│       └── supabase_functions.dart
│
├── features/
│   ├── home/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── search/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── details/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── library/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── favorites/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── wishlist/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── history/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── settings/
│   │   ├── presentation/
│   │   └── providers/
│   │
│   ├── movies/
│   ├── series/
│   ├── anime/
│   └── games/
│
└── main.dart
```

### Convenção de componentes

O projeto utilizará:

```text
components/
```

em vez de:

```text
widgets/
```

Essa escolha segue a preferência de organização semelhante a projetos React Native.

Componentes genéricos e reutilizáveis ficam em `core/components/`.

Componentes específicos de uma feature ficam dentro da própria feature.

---

# 7. Dependências

## Principais

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod:
  riverpod_annotation:

  dio:

  flutter_dotenv:

  cached_network_image:

  google_fonts:

  supabase_flutter:

  go_router:
```

## Desenvolvimento / geração de código

```yaml
dev_dependencies:
  build_runner:
  json_serializable:
```

Dependências adicionais poderão ser adicionadas conforme necessidades reais do projeto.

---

# 8. Riverpod

Riverpod será utilizado para:

- Estado das telas.
- Estado assíncrono.
- Injeção de dependências.
- Providers de repositories.
- Providers das APIs.
- Pesquisas.
- Biblioteca pessoal.
- Sincronização.
- Autenticação.
- Cache em memória.

A UI não deverá executar chamadas HTTP diretamente.

Evitar:

```dart
Dio().get(...);
```

dentro de páginas ou componentes.

Fluxo desejado:

```text
Widget
 ↓
Provider
 ↓
Repository
 ↓
Service / API
```

---

# 9. Dio

Será utilizado **Dio** como cliente HTTP.

O projeto utilizará uma única biblioteca Dio, mas poderá possuir clientes configurados separadamente:

```text
tmdbDio
anilistDio
steamDio
```

Cada cliente poderá ter:

- `baseUrl`
- headers
- timeout
- interceptors
- autenticação
- tratamento específico de erros

Exemplo conceitual:

```text
Repository
 ↓
API Client
 ↓
Dio
 ↓
API externa
```

---

# 10. TMDB

TMDB será REST.

Estrutura conceitual:

```text
MovieRepository
      ↓
TmdbRepository
      ↓
TmdbApi
      ↓
Dio
      ↓
TMDB
```

Os modelos da API não devem ser utilizados diretamente pelas telas.

---

# 11. AniList

AniList utiliza GraphQL.

Estrutura conceitual:

```text
AnimeRepository
      ↓
AniListRepository
      ↓
AniListApi
      ↓
Dio
      ↓
GraphQL
      ↓
AniList
```

As queries GraphQL devem ficar centralizadas em arquivos próprios e não espalhadas pelas telas.

---

# 12. Steam

A Steam terá uma integração diferenciada por causa da API Key.

A arquitetura planejada será:

```text
Flutter
   ↓
Supabase Edge Function
   ↓
Steam Web API
```

A chave da Steam deverá ficar como **secret da Edge Function**, e não no aplicativo Flutter.

Fluxo de sincronização:

```text
Flutter
   ↓
syncSteamLibrary()
   ↓
Supabase Edge Function
   ↓
IPlayerService.GetOwnedGames
   ↓
Steam
   ↓
Supabase
   ↓
Flutter
```

Para dados recentes:

```text
GetRecentlyPlayedGames
```

Para playtime específico, quando aplicável:

```text
GetSingleGamePlaytime
```

---

# 13. Supabase

O Supabase funcionará como o backend gerenciado do projeto.

Responsabilidades principais:

- Autenticação.
- PostgreSQL.
- Persistência da biblioteca.
- Sincronização entre dispositivos.
- Favoritos.
- Notas.
- Status.
- Progresso.
- Lista de desejos.
- Histórico.
- Dados sincronizados da Steam.
- Edge Functions.

Arquitetura:

```text
Flutter
 │
 ├── TMDB
 │
 ├── AniList
 │
 └── Supabase
       │
       ├── Auth
       ├── Database
       └── Edge Functions
              │
              └── Steam
```

O Supabase não precisa funcionar como proxy de todas as APIs.

---

# 14. Modelo de domínio

## MediaItem

Representa o conteúdo de maneira genérica.

Campos conceituais:

```text
id
source
sourceId
type
title
originalTitle
description
posterUrl
backdropUrl
releaseDate
rating
genres
```

Tipos:

```text
movie
series
anime
game
```

Fontes atuais:

```text
tmdb
anilist
steam
```

---

## Movie

Informações específicas de filmes.

Exemplos:

- duração;
- diretor;
- elenco;
- gêneros.

---

## Series

Informações específicas de séries.

Exemplos:

- temporadas;
- episódios;
- número de episódios;
- status;
- elenco.

---

## Anime

Informações específicas de anime.

Exemplos:

- episódios;
- temporada;
- formato;
- status;
- score.

---

## Game

Informações específicas de jogos.

Exemplos:

```text
developer
publisher
genres
steamAppId
estimatedMainStoryHours
estimatedCompletionistHours
```

---

# 15. UserMedia

`UserMedia` representa a relação do usuário com um conteúdo.

Campos conceituais:

```text
mediaId
status
favorite
userRating
notes
addedAt
startedAt
completedAt
```

Isso mantém separado:

```text
Conteúdo
```

de:

```text
Minha relação com o conteúdo
```

---

# 16. Progresso

O progresso precisa suportar diferentes tipos de mídia.

### Filme

```text
assistido / não assistido
```

ou percentual, quando aplicável.

### Série

```text
Temporada 2
Episódio 5
```

### Anime

```text
Episódio 37
```

### Jogo

```text
47 horas jogadas
```

Não deve existir um único campo de progresso rígido para todas as mídias.

---

# 17. Banco de dados inicial

O esquema final poderá evoluir durante a implementação, mas a estrutura conceitual inicial será próxima de:

```text
users
media
movies
series
animes
games
user_media
media_progress
game_user_data
sync_history
```

### `media`

Dados gerais do conteúdo.

```text
id
source
source_id
type
title
description
poster_url
backdrop_url
release_date
rating
created_at
updated_at
```

### `user_media`

Relação do usuário com o conteúdo.

```text
id
user_id
media_id
status
favorite
user_rating
notes
added_at
started_at
completed_at
```

### `media_progress`

Dados de progresso.

```text
id
user_media_id
current_season
current_episode
total_episodes
progress_percent
updated_at
```

### `game_user_data`

Dados sincronizados da Steam.

```text
id
user_id
media_id
steam_owned
steam_playtime_minutes
steam_playtime_2weeks
steam_last_played
steam_library_synced_at
```

O esquema poderá ser ajustado quando o modelo de domínio real for implementado.

---

# 18. Biblioteca pessoal

A biblioteca do aplicativo é independente da biblioteca Steam.

O usuário pode adicionar qualquer conteúdo ao aplicativo e definir seu próprio status.

Status previstos:

```text
planned
watching
paused
completed
dropped
```

A UI poderá apresentar nomes diferentes conforme o tipo de conteúdo, sem necessariamente mudar o conceito interno.

Exemplo para jogo:

```text
Planejado
Jogando
Pausado
Zerado
Abandonado
```

---

# 19. Lista de desejos

A lista de desejos será própria do aplicativo.

Ela não depende da wishlist de uma plataforma externa.

Exemplo:

```text
Baldur's Gate 3
Status: Planejado
Favorito: Não
Possuo na Steam: Não
```

Isso permite registrar jogos ou outros conteúdos que o usuário deseja acompanhar mesmo antes de possuir/comprar.

---

# 20. Tempo de jogo x duração estimada

Esses dois dados devem permanecer separados.

### Tempo real

Vem da Steam, quando disponível:

```text
steam_playtime_minutes
```

### Duração estimada

É um dado de catálogo:

```text
estimated_main_story_hours
estimated_main_plus_extras_hours
estimated_completionist_hours
```

Exemplo:

```text
Cyberpunk 2077

Estimativa:
História principal: ~25h
Extras: ~60h
Completista: ~100h+

Meu tempo:
47h
```

A fonte de duração de jogos poderá ser adicionada posteriormente como uma integração independente da Steam.

---

# 21. Busca global

A busca deverá reunir resultados de todas as fontes.

Exemplo:

```text
The Last of Us
```

Consulta:

```text
TMDB
├── Filmes
└── Séries

AniList
└── Anime

Steam
└── Jogos
```

Os resultados serão convertidos para entidades de domínio antes de chegarem à UI.

---

# 22. Cache

## Imagens

Utilizar:

```text
cached_network_image
```

para:

- posters;
- backdrops;
- imagens de jogos;
- thumbnails.

## Dados

O projeto poderá utilizar cache em memória inicialmente.

Caso o suporte offline exija persistência local mais avançada, um banco local poderá ser incluído posteriormente.

O Supabase será responsável pelos dados permanentes do usuário.

---

# 23. Variáveis de ambiente

Exemplo:

```env
TMDB_ACCESS_TOKEN=
SUPABASE_URL=
SUPABASE_ANON_KEY=
STEAM_ID=
```

A Steam API Key não deverá ficar no `.env` do aplicativo quando as chamadas forem feitas através de Edge Functions.

Ela deverá ser armazenada como **secret no Supabase**.

### Importante

`flutter_dotenv` organiza configuração, mas não deve ser tratado como mecanismo de proteção de segredos dentro de um aplicativo compilado.

---

# 24. Segurança

Princípios:

1. A UI não acessa APIs diretamente.
2. Credenciais privadas não ficam embutidas no aplicativo.
3. A Steam API Key fica na Edge Function.
4. Dados pessoais ficam no Supabase.
5. Utilizar Row Level Security (RLS) nas tabelas do usuário.
6. Não versionar `.env` ou secrets.
7. Manter regras de acesso do Supabase restritas ao usuário autenticado.

---

# 25. Telas previstas

## Home

- Continuar assistindo/jogando.
- Conteúdos recentes.
- Favoritos.
- Recomendações.
- Trending.
- Atividade recente.

## Busca

Busca global por:

```text
Filmes
Séries
Animes
Jogos
```

## Detalhes

Informações completas do conteúdo:

- título;
- descrição;
- imagens;
- gêneros;
- lançamento;
- avaliação;
- duração;
- elenco, quando aplicável;
- progresso;
- status;
- nota pessoal.

## Biblioteca

Filtros:

```text
Todos
Filmes
Séries
Animes
Jogos
```

Status:

```text
Planejado
Em andamento
Pausado
Concluído
Abandonado
```

## Favoritos

Conteúdos marcados pelo usuário.

## Lista de desejos

Conteúdos que o usuário pretende assistir ou jogar.

## Histórico

Registro de atividades.

## Configurações

- Conta.
- Steam.
- Sincronização.
- Preferências.
- Tema.
- Configurações do aplicativo.

---

# 26. Roadmap

## Fase 1 — Fundação

- [ ] Criar projeto Flutter.
- [ ] Configurar dependências.
- [ ] Criar estrutura de pastas.
- [ ] Configurar tema.
- [ ] Configurar fontes.
- [ ] Configurar GoRouter.
- [ ] Configurar Riverpod.
- [ ] Configurar Dio.
- [ ] Configurar `.env`.
- [ ] Configurar Supabase.

## Fase 2 — Layout

- [ ] Implementar layout criado no Stitch.
- [ ] Criar componentes reutilizáveis.
- [ ] Implementar navegação.
- [ ] Implementar loading, erro e estados vazios.

## Fase 3 — TMDB

- [ ] Configurar API.
- [ ] Implementar busca.
- [ ] Implementar filmes.
- [ ] Implementar séries.
- [ ] Implementar detalhes.
- [ ] Implementar imagens.
- [ ] Implementar trending/populares.

## Fase 4 — AniList

- [ ] Configurar GraphQL.
- [ ] Implementar busca.
- [ ] Implementar detalhes.
- [ ] Implementar episódios.
- [ ] Implementar temporadas.
- [ ] Implementar trending.

## Fase 5 — Steam

- [ ] Configurar Steam Web API.
- [ ] Criar Edge Function.
- [ ] Configurar API Key como secret.
- [ ] Implementar `GetOwnedGames`.
- [ ] Implementar `GetRecentlyPlayedGames`.
- [ ] Implementar playtime.
- [ ] Implementar sincronização.
- [ ] Relacionar Steam App ID aos jogos.

## Fase 6 — Biblioteca

- [ ] Criar tabela `media`.
- [ ] Criar `user_media`.
- [ ] Implementar favoritos.
- [ ] Implementar notas.
- [ ] Implementar status.
- [ ] Implementar progresso.
- [ ] Implementar lista de desejos.
- [ ] Implementar histórico.

## Fase 7 — Sincronização

- [ ] Sincronização com Supabase.
- [ ] Sincronização Steam.
- [ ] Controle de última sincronização.
- [ ] Tratamento de erros.
- [ ] Estados offline/online.

## Fase 8 — Estatísticas

- [ ] Filmes assistidos.
- [ ] Séries concluídas.
- [ ] Animes concluídos.
- [ ] Jogos concluídos.
- [ ] Horas jogadas.
- [ ] Horas assistidas.
- [ ] Nota média.
- [ ] Atividade por período.

---

# 27. Decisões arquiteturais

## 1. O domínio não depende das APIs

A UI não deve saber se o conteúdo veio do TMDB, AniList ou Steam.

```text
API
 ↓
DTO
 ↓
Mapper
 ↓
Domain Entity
 ↓
UI
```

## 2. Steam é a única plataforma de jogos no MVP

Epic Games, GOG, Ubisoft Connect e EA ficam fora da primeira versão.

A arquitetura poderá ser expandida no futuro.

## 3. Steam não define a biblioteca pessoal

A Steam é uma fonte externa e uma integração de sincronização.

A biblioteca do aplicativo pertence ao usuário e fica no Supabase.

## 4. Catálogo e relação do usuário são separados

```text
Media
```
representa o conteúdo.

```text
UserMedia
```
representa a relação do usuário com o conteúdo.

## 5. Supabase é o backend gerenciado

Não será criado inicialmente um backend tradicional separado.

O Supabase fornecerá:

```text
Auth
Database
Edge Functions
```

## 6. Components

A convenção do projeto utiliza:

```text
components/
```

e não `widgets/`.

---

# 28. Ordem recomendada de implementação

A implementação deverá começar pela base do projeto e evoluir por camadas:

```text
1. Projeto Flutter
   ↓
2. Dependências
   ↓
3. Estrutura de pastas
   ↓
4. Tema
   ↓
5. Components
   ↓
6. Navegação
   ↓
7. Riverpod
   ↓
8. Dio
   ↓
9. Supabase
   ↓
10. Domain Entities
   ↓
11. TMDB
   ↓
12. AniList
   ↓
13. Steam
   ↓
14. Biblioteca
   ↓
15. Sincronização
   ↓
16. Estatísticas
```

A prioridade é construir primeiro uma base funcional e desacoplada.

---

# 29. Princípios de desenvolvimento

- Código simples e legível.
- Responsabilidades bem separadas.
- Evitar lógica de negócio dentro da UI.
- Evitar chamadas HTTP dentro de componentes.
- Evitar dependência direta da UI com modelos das APIs.
- Reutilizar componentes.
- Utilizar Riverpod para estado e dependências.
- Utilizar repositories para acesso aos dados.
- Manter integrações externas isoladas.
- Não armazenar secrets no aplicativo.
- Evitar otimização prematura.
- Priorizar funcionalidades completas e testáveis.

---

# 30. Status do projeto

**Em desenvolvimento — planejamento concluído e início da implementação.**

O layout inicial foi desenvolvido no Stitch.

A próxima etapa é transformar esta arquitetura em código Dart, começando pela fundação do aplicativo, tema, navegação, providers, clientes HTTP e integração inicial com TMDB.

---

# 31. Próximos passos de código

A sequência recomendada para começar o desenvolvimento é:

```text
main.dart
 ↓
app.dart
 ↓
app_theme.dart
 ↓
router.dart
 ↓
Riverpod providers
 ↓
Dio providers
 ↓
TMDB API client
 ↓
TMDB models
 ↓
TMDB mapper
 ↓
Movie repository
 ↓
Movie provider
 ↓
Tela de busca
```

Depois da primeira integração completa, o mesmo padrão poderá ser aplicado a AniList, Steam e Supabase.
