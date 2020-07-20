module Helper
  def tirar_foto(nome_arquivo, resultado)
    @data_atual = Time.now.strftime('%d%m%Y_%H%M%S').to_s
    $caminho_arquivo = "reports/screenshot/test_#{resultado}/#{@data_atual}"
    FileUtils.mkdir_p($caminho_arquivo) unless File.exist?($caminho_arquivo)
    foto = "#{$caminho_arquivo}/#{nome_arquivo}.png"
    Capybara.page.save_screenshot(foto)
    embed(foto, 'image/png', 'Clique Aqui!')
  end
end
