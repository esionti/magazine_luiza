class Search < SitePrism::Page
  element :produtos_total_container, '.neemu-products-container.nm-view-type-grid'
  elements :seleciona_produto, '.nm-product-item'

  def seleciona_primeiro_produto
    wait_until_produtos_total_container_visible
    seleciona_produto.first.click
  end
end
