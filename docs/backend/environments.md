# Ambientes

## Ambientes previstos

- Desenvolvimento local.
- Projeto Supabase de desenvolvimento.
- Produção futura.

## Configuração

- URLs e chaves públicas são fornecidas por ambiente.
- Segredos server-side não entram no build Flutter.
- Dados reais não são copiados para desenvolvimento.
- Arquivos locais com valores reais permanecem ignorados pelo Git.

## Promoção

- Código e migrations avançam de forma versionada.
- Produção não recebe alterações manuais sem registro.
- Configurações obrigatórias devem ser verificadas antes do build.
