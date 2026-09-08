# Modelo de dados

## Tabelas iniciais

- `profiles`.
- `media`.
- `user_media`.
- `media_progress`.
- `user_preferences`.

## Responsabilidades

- `media`: cache normalizado do catálogo.
- `user_media`: relação pessoal, situação e datas.
- `media_progress`: episódios assistidos.
- `user_preferences`: preferências em PT-BR e comportamento.

## Convenções

- Tabelas e colunas em `snake_case`.
- Chaves primárias UUID.
- Timestamps em UTC.
- `created_at` e `updated_at` em entidades mutáveis.
- Unicidade de mídia por fonte, ID externo e tipo.
- Unicidade de biblioteca por usuário e mídia.
- Índices criados a partir de consultas reais.

## Futuro

Jogos entram por migration explícita. Tempo jogado permanece separado de progresso episódico.
