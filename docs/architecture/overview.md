# Visão geral da arquitetura

## Princípios

- Organização por funcionalidade.
- Clean Architecture simplificada.
- Domínio independente de Flutter e APIs.
- Acesso externo atrás de contratos de repository.
- Abstrações criadas por necessidade.
- Uma página por funcionalidade, sem duplicação por plataforma no MVP.

## Fluxo principal

```text
View -> Provider/ViewModel -> caso de uso -> repository
  ^                                         |
  |                                         v
  +--------------- estado <- domínio <- data source
```

## Camadas

- **Presentation:** páginas, widgets e estado da interface.
- **Domain:** entidades, regras, casos de uso e contratos.
- **Data:** DTOs, mappers, data sources e implementations de repositories.
- **App:** inicialização, tema, rotas e composição.
- **Core:** somente recursos compartilhados por múltiplas features.

## Dependências

```text
presentation -> domain <- data
```

Uma feature não importa detalhes internos de outra. A UI nunca chama TMDB, AniList ou Supabase diretamente.
