E('não seleciono o serviço de garantia extendia') do
  @app.garantia_ext.nao_add_garantia
end

E('seleciono o serviço de garantia extendia {string}') do |garantia|
  @app.garantia_ext.add_garantia(garantia)
end

E('clico em continuar') do
  @app.garantia_ext.press_botao_continuar
end
