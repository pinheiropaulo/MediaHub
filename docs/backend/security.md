# Segurança

## Row Level Security

- RLS é obrigatória em tabelas pessoais.
- Políticas explícitas validam `auth.uid()`.
- Inserções e atualizações impedem troca de proprietário.
- Grants seguem menor privilégio.

## Segredos

- Chaves públicas necessárias ao cliente dependem de RLS.
- `service_role` nunca fica no Flutter ou no repositório.
- Segredos de terceiros pertencem ao backend.
- Arquivos com credenciais não são versionados.

## Dados pessoais

- Coletar somente o necessário para o uso pessoal.
- Não registrar biblioteca, tokens ou e-mail em telemetria insegura.
- Exclusão de conta exige confirmação e validação server-side.

## Verificação

Políticas devem ter testes com usuários diferentes e requisições anônimas.
