class Home < SitePrism::Page
  set_url Capybara.app_host.to_s
  element :campo_pesquisa, '[placeholder="procure por código, nome, marca..."]'
  element :botao_lupa, '.container-bloom-header.field-icon-search'

  def pesquisa_produto(produto)
    wait_until_campo_pesquisa_visible
    campo_pesquisa.set sort_produto(produto)
    wait_until_botao_lupa_visible
    botao_lupa.click
  end

  def sort_produto(produto)
    product_file = YAML.load_file('features/support/massa/produtos.yml')
    produtos = product_file[produto].to_s
    produtos = produtos.split(',')
    produto = produtos[rand(0...produtos.length)]
    produto
  end
end
