# Gerenciamento de estado

## Decisão

Riverpod gerencia estado e composição de dependências.

## Responsabilidades

- Sessão autenticada.
- Estados assíncronos.
- Busca e filtros.
- Biblioteca e progresso.
- Injeção de data sources e repositories.

## Regras

- Providers não dependem de `BuildContext`.
- Widgets observam estado e enviam intenções.
- Regras de domínio não ficam em callbacks visuais.
- Loading, dados e erro são explícitos.
- Estado vazio é derivado de dados carregados.
- Eventos efêmeros não devem permanecer como estado durável.

## Testes

- Testar transições de estado.
- Substituir dependências por fakes.
- Cobrir sucesso, vazio, falha e retry.
