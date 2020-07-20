class Carrinho < SitePrism::Page
  element :titulo_produto_carrinho, '.BasketItemProduct-info-title'
  element :preco_produto_carrinho, '.BasketItem-productContainer .BasketItemProduct-price'
  element :subtotal_produto_carrinho, '.BasketPriceBox-prices-values'
  element :preco_garantia_carrinho, '.BasketItem-warrantyContainer .BasketItemProduct-price'

  def valida_desc_produto
    wait_until_titulo_produto_carrinho_visible
    $titulo_produto == titulo_produto_carrinho.text
  end
  
  def valida_sem_garantia
    valida_desc_produto
    @produto_preco = preco_produto_carrinho.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_preco)
    $preco_produto = @produto_preco
    @produto_subtotal = subtotal_produto_carrinho.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_subtotal)
    $preco_produto = @produto_subtotal
  end

  def valida_com_garantia
    valida_desc_produto

    @produto_preco = preco_produto_carrinho.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_preco)
    $preco_produto = @produto_preco

    @garantia_preco = preco_garantia_carrinho.text
    Utils.SITE_PRICE_TO_FLOAT(@garantia_preco)
    $valor_garantia.round(2) == @garantia_preco.to_f.round(2)

    @produto_subtotal_garantia = subtotal_produto_carrinho.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_subtotal_garantia)
    $valor_subtotal_garantia == @produto_subtotal_garantia.to_f.round(2)


  end
end