class GarantiaExtendida < SitePrism::Page
  element :garantia_texto_container, '.table-warranty.js-warranty-GE'
  element :botao_continuar, '.price-warranty__btn--continue'
  element :sem_garantia, '#no-warranty'
  element :um_ano_garantia, '#one-year-warranty'
  element :dois_anos_garantia, '#two-year-warranty'
  element :subtotal, '.subtotal'
  elements :parcelas_um_ano, '.table-warranty__td-txt--blue .js-warranty-parcel-quantity'
  elements :parcelas_dois_anos, '.table-warranty__tr .table-warranty__td-txt--blue.table-warranty__none .js-warranty-parcel-quantity'
  elements :valor_parcelas_um, '.table-warranty__tr .js-warranty-one-parcel-price'
  elements :valor_parcelas_dois, '.table-warranty__tr .js-warranty-two-parcel-price'


  def nao_add_garantia
    wait_until_garantia_texto_container_visible
    sem_garantia.click
    subtotal_sem_garantia
  end

  def add_garantia garantia
    wait_until_garantia_texto_container_visible
    case garantia
      when '1_ano'
        um_ano_garantia.click
        @parcelas = parcelas_um_ano.first.text
        @valor_parcela = valor_parcelas_um.first.text
      when '2_ano'
        dois_anos_garantia.click
        @parcelas = parcelas_dois_anos.first.text
        @valor_parcela = valor_parcelas_dois.first.text
      else
         tracing_error "Erro! Garantia de #{garantia} inválida. Escolha entre '1_ano' e '2_ano'"
    end
    subtotal_com_garantia(@parcelas, @valor_parcela)
  end

  def press_botao_continuar
    botao_continuar.click
  end

  def subtotal_sem_garantia
    @produto_subtotal = subtotal.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_subtotal)
    @produto_subtotal == $preco_produto
  end

  def subtotal_com_garantia(parcelas, valor_parcela)
    valor_com_garantia(parcelas, valor_parcela)
    @produto_subtotal = subtotal.text
    Utils.SITE_PRICE_TO_FLOAT(@produto_subtotal)
    $valor_subtotal_garantia == @produto_subtotal.to_f.round(2)
  end

  def valor_com_garantia(parcelas, valor_parcela)
    Utils.SITE_PRICE_TO_FLOAT(valor_parcela)    
    $valor_garantia = parcelas.to_i * valor_parcela.to_f    
    $valor_subtotal_garantia = $preco_produto.to_f + $valor_garantia.to_f
  end
end
