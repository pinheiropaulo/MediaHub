# Regras de negócio

## Catálogo e biblioteca

- TMDB e AniList fornecem catálogo público.
- Supabase guarda a relação pessoal do usuário com a mídia.
- Encontrar uma mídia não a adiciona automaticamente à biblioteca.
- Uma mídia é identificada por fonte, ID externo e tipo.

## Tipos

- `movie`: filme.
- `series`: série.
- `anime`: anime.

## Situações pessoais

- `planned`: quero assistir.
- `watching`: assistindo.
- `completed`: concluído.
- `paused`: em pausa.
- `dropped`: abandonado.

Os valores persistidos não dependem do texto traduzido.

## Progresso

- Filmes normalmente usam progresso 0 ou 1.
- Séries e animes registram progresso por episódio.
- O progresso não pode ser negativo nem ultrapassar o total conhecido.
- Marcar todos os episódios disponíveis não deve concluir automaticamente uma obra ainda em exibição sem regra explícita.
- Remover uma mídia da biblioteca exige confirmação.

## Datas

- Datas e horários persistidos usam UTC quando representam um instante.
- Datas civis podem usar `date` quando horário não tiver significado.
- Conclusão pode registrar `completed_at`.

## Evolução futura

Jogos terão regras próprias de biblioteca e tempo jogado. Essas regras não devem ser antecipadas no domínio do MVP.
