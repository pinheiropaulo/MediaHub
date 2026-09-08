# Estrutura de pastas

## Estrutura alvo

```text
lib/
|-- app/
|   |-- app.dart
|   |-- dependencies/
|   |-- router/
|   `-- theme/
|-- core/
|   |-- errors/
|   |-- network/
|   |-- result/
|   |-- utils/
|   `-- widgets/
|-- features/
|   |-- authentication/
|   |-- home/
|   |-- search/
|   |-- library/
|   |-- media_details/
|   |-- statistics/
|   `-- settings/
`-- main.dart
```

Cada feature pode conter:

```text
feature/
|-- data/
|   |-- data_sources/
|   |-- models/
|   `-- repositories/
|-- domain/
|   |-- entities/
|   |-- repositories/
|   `-- use_cases/
`-- presentation/
    |-- pages/
    |-- providers/
    `-- widgets/
```

## Regras

- Não criar diretórios vazios antecipadamente.
- Widgets de uma única feature permanecem nela.
- `core` exige reutilização real.
- Arquivos usam `snake_case`; classes e enums, `UpperCamelCase`.
- Páginas terminam em `_page.dart`.
- Não criar pares `_mobile_layout.dart` e `_web_layout.dart` no MVP.
