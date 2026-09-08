# Modelos e mapeamento

## Tipos

- DTO representa uma resposta externa.
- Entidade representa o domínio do Media Hub.
- Modelo de persistência representa uma tabela quando necessário.
- Mapper converte entre formatos.

## Identidade

Toda mídia externa preserva:

- `source`;
- `sourceId`;
- `type`.

## Regras

- DTOs não chegam à apresentação.
- Entidades não dependem de Flutter, Dio ou Supabase.
- Modelos são imutáveis quando possível.
- Enums persistidos usam valores estáveis.
- Ausência de imagem, data ou sinopse é válida e possui fallback.
- HTML em sinopses externas deve ser sanitizado.
- Falhas de campos essenciais geram erro de mapeamento controlado.
