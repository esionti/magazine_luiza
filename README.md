# Front-Onboarding - Testes/Front 
Projeto com estrutura base para automação dos testes de Front-end para todos os times da Via Varejo. 

## Inicialização
Esta stack utiliza as seguintes ferramentas:
1.	[Ruby](https://rubyinstaller.org/)
2.	[Cucumber](https://cucumber.io/)
3.	[Site-Prism](https://github.com/site-prism/site_prism)
4. [Git] (https://git-scm.com/download/win)

### Pré requisitos
Necessário instalar o [Ruby](https://rubyinstaller.org/) na versão 2.5.x e em seguida rodar os comandos através terminal:

```
gem install bundler
```

### Instalação
Clone o projeto utilizando o comando
```
git clone https://github.com/esionti/magazine_luiza.git
```
Execute o comando abaixo para realizar a instalação das dependencias:
```
bundle install
```

# Executando os Testes
Após a instalação das dependências e configuração do ambiente, vamos executar os testes. 
```
rake test[brand_environment, exec_device, exec_mode, graphic_mode, tags]
```
brand_environment - magluiza_hlg/magluiza_prd
exec_device - desktop/mobile
exec_mode - local
graphic_mode - graphic/headless (com renderização em tela/sem renderização em tela) *mesmo em modo headless os prints para reports funcionam
tags - conforme tageamento das features no projeto

# Executando os Testes no Docker
Após a instalação e configuração do Docker, vamos executar os testes. 
```
docker-compose build
docker-compose run app bundle exec rake test[brand_environment, exec_device, exec_mode, graphic_mode, tags]
