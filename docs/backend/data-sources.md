# Fontes de dados

## TMDB

Fonte de filmes e séries:

- busca e tendências;
- detalhes, gêneros e datas;
- imagens;
- temporadas e episódios;
- avaliações do catálogo e relacionados.

Usar REST por cliente Dio dedicado e `pt-BR` quando suportado.

Documentação: <https://developer.themoviedb.org/>

## AniList

Fonte de animes:

- busca e tendências;
- títulos, sinopse, gêneros e estúdios;
- estado de exibição e episódios;
- imagens e relacionados.

Queries GraphQL ficam centralizadas fora dos widgets.

Documentação: <https://docs.anilist.co/>

## Supabase

Fonte de verdade para autenticação, perfil, biblioteca, progresso e preferências.

Documentação: <https://supabase.com/docs>

## Steam futura

A Steam poderá fornecer catálogo, jogos possuídos e tempo jogado no futuro. Não faz parte do MVP. Chaves privadas deverão permanecer no backend.
