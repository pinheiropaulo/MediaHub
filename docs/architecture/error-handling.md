# Tratamento de erros

## Categorias

- Rede indisponível.
- Timeout.
- Conteúdo não encontrado.
- Limite temporário da API.
- Sessão expirada.
- Permissão negada.
- Dado inválido.
- Falha inesperada.

## Fluxo

```text
erro externo -> data source -> failure de domínio -> estado -> mensagem em PT-BR
```

## Regras

- Não expor stack trace ou mensagem crua ao usuário.
- Oferecer retry quando a operação for repetível.
- Sessão expirada conduz ao fluxo de autenticação.
- Falha de imagem não bloqueia o restante da tela.
- Logs não contêm tokens, chaves ou dados pessoais.
