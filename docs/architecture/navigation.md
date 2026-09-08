# Navegação

## Decisão

O Media Hub usa `go_router` com rotas declarativas em `lib/app/router/`.

## Árvore principal

```text
Splash
|-- Autenticação
|   |-- Login
|   |-- Cadastro
|   `-- Recuperação de senha
`-- Aplicativo autenticado
    |-- Início
    |-- Buscar
    |-- Biblioteca
    |-- Estatísticas
    `-- Configurações
```

Detalhes de filme, série e anime são rotas secundárias.

## Regras

- Sessão desconhecida permanece no Splash.
- Usuário sem sessão vai ao Login.
- Rotas autenticadas usam um shell com navegação inferior.
- Dialogs e bottom sheets não viram páginas sem necessidade.
- Caminhos e nomes técnicos ficam em inglês.
- Detalhes recebem fonte, tipo e ID recuperáveis.
- Deep links de autenticação validam sessão e parâmetros.

## Estado atual

O router atual possui apenas Login e Início. As demais rotas serão implementadas durante o MVP.
