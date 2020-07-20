class ProdutoDetalhes < SitePrism::Page
  element :titulo_produto, '.header-product__title'
  element :preco_produto, '.price-template__text'
  element :botao_sacola, '.button__buy.button__buy-product-detail'

  def salva_detalhes_produto
    wait_until_titulo_produto_visible
    $titulo_produto = titulo_produto.text

    @produto_preco = preco_produto.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_preco)
    $preco_produto = @produto_preco
  end

  def botao_add_sacola
    wait_until_botao_sacola_visible
    botao_sacola.click
  end
end
