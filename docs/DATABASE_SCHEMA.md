# Esquema do Banco de Dados (Supabase)

O **MediaHub** utiliza o **Supabase** como backend gerenciado para Autenticação, Banco de Dados (PostgreSQL) e Edge Functions[cite: 4].

O princípio central do banco de dados é a **separação entre o Catálogo e a Biblioteca Pessoal**[cite: 4]. O fato de um conteúdo existir no catálogo global não significa que o usuário interage com ele.

Abaixo está a estrutura conceitual inicial das principais tabelas do sistema[cite: 4]:

---

## 1. Catálogo Global (`media`)

Esta tabela armazena os dados gerais e em cache do conteúdo consumido das APIs externas (TMDB, AniList, Steam)[cite: 4].

```text
id (PK)
source              # Origem (tmdb, anilist, steam)[cite: 4]
source_id           # ID na plataforma de origem[cite: 4]
type                # Tipo (movie, series, anime, game)[cite: 4]
title               # Título do conteúdo[cite: 4]
description         # Sinopse/Descrição[cite: 4]
poster_url          # URL da imagem de capa[cite: 4]
backdrop_url        # URL da imagem de fundo[cite: 4]
release_date        # Data de lançamento[cite: 4]
rating              # Avaliação média (Catálogo)[cite: 4]
created_at
updated_at
