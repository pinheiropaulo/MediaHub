# Fontes de Dados e Integrações (Data Sources)

Este documento detalha os provedores externos utilizados pelo **MediaHub** para compor o catálogo de entretenimento[cite: 4]. O aplicativo atua como um agregador, mas é crucial entender que **o catálogo de uma API é completamente separado da biblioteca pessoal do usuário**[cite: 4].

---

## 1. TMDB (The Movie Database)
O TMDB é a principal fonte de dados e metadados para **Filmes e Séries**[cite: 4]. Toda a comunicação com esta plataforma é feita via padrão **REST**[cite: 4].

**Usos Previstos no Sistema:**
* Busca global, busca específica de filmes e busca específica de séries[cite: 4].
* Obtenção de detalhes completos (filmes e séries)[cite: 4].
* Elenco e informações relacionadas (atores, diretores)[cite: 4].
* Gêneros, datas de lançamento e avaliações gerais[cite: 4].
* Imagens de mídia: Pôsteres e Backdrops[cite: 4].
* Listagem de conteúdos populares e em alta (trending)[cite: 4].

**Documentação Oficial:** [https://developer.themoviedb.org/](https://developer.themoviedb.org/)[cite: 4]

---

## 2. AniList
O AniList é a fonte exclusiva de dados para **Animes**[cite: 4]. Diferente do TMDB, a comunicação com o AniList é feita via **GraphQL**, o que exige que as queries fiquem centralizadas em arquivos próprios e não espalhadas pelas telas[cite: 4].

**Usos Previstos no Sistema:**
* Busca de animes e obtenção de detalhes[cite: 4].
* Gêneros, sinopses e status de lançamento[cite: 4].
* Estrutura de temporadas e episódios[cite: 4].
* Avaliações da comunidade e imagens[cite: 4].
* Conteúdos em destaque e tendências (trending)[cite: 4].

**Documentação Oficial:** [https://anilist.gitbook.io/anilist-apiv2-docs/](https://anilist.gitbook.io/anilist-apiv2-docs/)[cite: 4]

---

## 3. Steam Web API
A Steam é a **única plataforma de jogos integrada no MVP** (plataformas como Epic Games, GOG, Ubisoft Connect e EA estão fora da primeira versão, mas a arquitetura permite expansões futuras)[cite: 4].

A integração da Steam possui **dois papéis distintos** no aplicativo[cite: 4]:

### A. Catálogo de Jogos
Permite ao usuário pesquisar jogos existentes na base de dados (ex: "Elden Ring", "Cyberpunk 2077"), mesmo que ele não possua o jogo na sua conta[cite: 4].

### B. Sincronização de Conta (Opcional)
Quando configurada, o aplicativo sincroniza os dados da conta Steam do usuário, consumindo a interface `IPlayerService`[cite: 4].
* **Dados sincronizados:** Jogos possuídos, Steam App ID, nome dos jogos, tempo total jogado, tempo jogado recentemente[cite: 4].
* **Métodos Relevantes:** `GetOwnedGames`, `GetRecentlyPlayedGames`, `GetSingleGamePlaytime`[cite: 4].

**Regra Crítica de Segurança:**
A integração com a Steam exige uma API Key. **Esta chave NUNCA deve ser armazenada no aplicativo Flutter (nem mesmo no arquivo `.env`)**[cite: 4]. Toda a comunicação com a Steam deve passar por uma **Edge Function no Supabase**, onde a API Key fica armazenada como um *secret* seguro[cite: 4].

**Documentação Oficial:** [https://partner.steamgames.com/doc/webapi/IPlayerService](https://partner.steamgames.com/doc/webapi/IPlayerService)[cite: 4]

---

## 4. Duração Estimada vs. Tempo Real
É fundamental separar métricas de tempo dependendo da fonte[cite: 4]:
* **Tempo Real (Playtime):** Vem da Steam (`steam_playtime_minutes`), refletindo quanto tempo o usuário efetivamente jogou[cite: 4].
* **Duração Estimada:** É um dado de catálogo (ex: `estimated_main_story_hours`), indicando o tempo previsto para zerar o conteúdo (útil para jogos não iniciados)[cite: 4].
