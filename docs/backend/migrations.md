# Migrations

## Fonte de verdade

O histórico SQL versionado é a fonte de verdade do banco.

## Regras

- Não editar migration já aplicada.
- Cada mudança estrutural recebe nova migration.
- Incluir tabelas, índices, constraints, grants e RLS relacionados.
- Migrations devem aplicar do zero em ambiente limpo.
- Seeds usam dados fictícios e não pessoais.
- Alterações destrutivas exigem plano de preservação e rollback.

## Fluxo

1. Criar migration.
2. Aplicar localmente.
3. Executar lint e testes SQL.
4. Revisar o diff.
5. Promover entre ambientes.
