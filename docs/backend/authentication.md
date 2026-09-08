# Autenticação

## Provedor

Supabase Auth gerencia identidade e sessão.

## Fluxos do MVP

- Cadastro por e-mail e senha.
- Login e logout.
- Google Sign-In.
- Recuperação e redefinição de senha.
- Restauração da sessão no Splash.

## Regras

- Estado desconhecido não é tratado como usuário deslogado.
- Perfil pessoal é criado de forma idempotente.
- Respostas não revelam desnecessariamente se um e-mail existe.
- Deep links validam destino e sessão.
- Tokens não aparecem em logs.
- Exclusão de conta é confirmada e executada com autorização server-side.

## Testes mínimos

- Sessão ausente, válida e expirada.
- Cadastro e login inválidos.
- Recuperação de senha.
- Isolamento de dados entre usuários.
