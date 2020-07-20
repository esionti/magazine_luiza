# language: pt

@regression
@smoke

Funcionalidade: Fluxo inclusão de produto no carrinho
  Como um cliente
  Desejo incluir produtos no meu carrinho sem autenticação
  Para que eu possa futuramente escolher em concluir ou não a compra

  Contexto: 
    Dado que estou na home page

    @carrinho_sem_garantia
    Esquema do Cenário: Inserir produto no carrinho sem garantia
      Quando adiciona uma produto de minha escolha do carrinho sem garantia
        | produto |
        |<produto>|
      Então confirmo se o produto foi adicionado corretamente no carrinho sem garantia

      Exemplos:
        | produto   |
        | televisao |

    @carrinho_com_garantia
    Esquema do Cenário: Inserir produto no carrinho com garantia
      Quando adiciona uma produto de minha escolha do carrinho com garantia
        | produto | garantia |
        |<produto>|<garantia>|
      Então confirmo se o produto foi adicionado corretamente no carrinho com garantia

      Exemplos:
        | produto   | garantia |
        | televisao | 1_ano    |
        | celular   | 2_ano    |
