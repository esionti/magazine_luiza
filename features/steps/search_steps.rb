E('busco e seleciono um {string}') do |produto|
  @app.home.pesquisa_produto(produto)
  @app.search.seleciona_primeiro_produto
end
