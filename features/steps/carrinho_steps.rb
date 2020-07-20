Quando('adiciona uma produto de minha escolha do carrinho sem garantia') do |table|
  table.hashes.each do |row|  
    step "busco e seleciono um '#{row[:produto]}'"
    step 'clico em adicionar à sacola'    
    step "não seleciono o serviço de garantia extendia"
    step 'clico em continuar'
  end
end

Quando('adiciona uma produto de minha escolha do carrinho com garantia') do |table|
  table.hashes.each do |row|  
    step "busco e seleciono um '#{row[:produto]}'"
    step 'clico em adicionar à sacola'    
    step "seleciono o serviço de garantia extendia '#{row[:garantia]}'"
    step 'clico em continuar'
  end
end

Então('confirmo se o produto foi adicionado corretamente no carrinho sem garantia') do
  @app.carrinho.valida_sem_garantia
end

Então('confirmo se o produto foi adicionado corretamente no carrinho com garantia') do
  @app.carrinho.valida_com_garantia
end
