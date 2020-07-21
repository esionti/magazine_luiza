E('clico em adicionar à sacola') do
  @app.produto_detalhes.salva_detalhes_produto
  @app.produto_detalhes.botao_add_sacola
end
