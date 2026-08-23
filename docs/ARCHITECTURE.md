# Arquitetura e Padrões de Desenvolvimento

Este documento define a base estrutural do **MediaHub**. O projeto adota uma abordagem de **Feature-first com uma Clean Architecture simplificada**.

O objetivo central desta arquitetura é manter a Interface de Usuário (UI) estritamente independente das fontes externas (APIs) e isolar o domínio da aplicação.

---

## 1. O Fluxo de Dados (Data Flow)

A regra de ouro do projeto é: **A UI nunca deve executar chamadas HTTP diretamente** (ex: `Dio().get(...)` em um botão é proibido). As respostas cruas das APIs nunca devem chegar à interface[cite: 4].

O fluxo de dados obedece à seguinte sequência hierárquica[cite: 4]:
1. **API:** Retorna o dado externo (TMDB, Steam, AniList)[cite: 4].
2. **DTO / Model:** Mapeia o JSON bruto[cite: 4].
3. **Mapper:** Converte o DTO para uma Entidade de Domínio limpa[cite: 4].
4. **Domain Entity:** O objeto purificado que o aplicativo entende[cite: 4].
5. **Riverpod:** Gerencia o estado e injeta na interface[cite: 4].
6. **UI:** Apenas desenha a tela com base no estado do Riverpod[cite: 4].

---

## 2. Gerenciamento de Estado e Rede

### Riverpod
O `flutter_riverpod` é o coração arquitetural do aplicativo[cite: 4]. Ele é responsável por:
* Gerenciar estados de telas e estados assíncronos (Loading, Data, Error)[cite: 4].
* Realizar a Injeção de Dependências (Providers de Repositories e APIs)[cite: 4].
* Controlar autenticação, cache em memória e sincronização[cite: 4].

### Dio
O **Dio** é o cliente HTTP exclusivo[cite: 4]. Em vez de instâncias globais soltas, o projeto utiliza instâncias separadas (Clientes) para cada domínio (`tmdbDio`, `anilistDio`, `steamDio`), permitindo customizações individuais de headers, interceptors e timeouts[cite: 4].

---

## 3. Estrutura de Diretórios

A árvore de arquivos reflete a separação de responsabilidades (Feature-First)[cite: 4]:

```text
lib/
├── app/                  # Orquestração (Router, Tema global)[cite: 4]
│
├── core/                 # Códigos genéricos e compartilhados[cite: 4]
│   ├── constants/        # (URLs, Chaves, Constantes do App)[cite: 4]
│   ├── errors/           # (Exceptions, Failures)[cite: 4]
│   ├── network/          # (Configurações do Dio, Interceptors)[cite: 4]
│   ├── utils/            # (Formatadores de Data, String, Duração)[cite: 4]
│   └── components/       # (Widgets visuais reutilizáveis: loading, inputs, logos)[cite: 4]
│
├── domain/               # O coração do negócio (Independente de APIs)[cite: 4]
│   ├── entities/         # (Movie, Series, Anime, Game, MediaItem)[cite: 4]
│   └── enums/            # (MediaType, MediaStatus)[cite: 4]
│
├── data/                 # Gerenciamento de dados unificados[cite: 4]
│   ├── repositories/     # (Contratos de abstração: MovieRepository, etc)[cite: 4]
│   └── local/            # (Cache local)[cite: 4]
│
├── services/             # Integrações estritas com o mundo externo[cite: 4]
│   ├── tmdb/             # (Modelos, Mapper e Repository do TMDB)[cite: 4]
│   ├── anilist/          # (Modelos, Mapper, Queries GraphQL do AniList)[cite: 4]
│   ├── steam/            # (Modelos, Mapper e Sync Service da Steam)[cite: 4]
│   └── supabase/         # (Autenticação, Database e Edge Functions)[cite: 4]
│
└── features/             # Interfaces agrupadas por funcionalidade[cite: 4]
    ├── auth/
    ├── home/             # (presentation/ e providers/)[cite: 4]
    ├── search/
    ├── details/
    └── library/
