# Padrões de código

## Idioma

- Código, classes e arquivos em inglês.
- Interface, mensagens e documentação em PT-BR.

## Dart e Flutter

- Seguir `analysis_options.yaml`.
- Usar `const` quando aplicável.
- Manter widgets pequenos e coesos.
- Evitar números e cores espalhados fora do tema.
- Não criar páginas mobile e Web separadas no MVP.
- Widgets específicos permanecem na feature.

## Assíncrono e erros

- Não ignorar futures relevantes.
- Não capturar erros sem tratamento.
- Converter erros externos em failures do domínio.
- Cancelar recursos no ciclo de vida adequado.

## Testes

Código novo deve ser testável sem rede real sempre que possível.
