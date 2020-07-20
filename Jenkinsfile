properties([
  [$class: 'JiraProjectProperty'],
  parameters(
    [
      choice(
        choices: ['magluiza_prd', 'magluiza_hlg'],
        description: 'Ambiente em que o teste será rodado.',
        name: 'brand_environment'
        ),
      choice(
        choices: ['desktop'],
        description: 'Dispositivo em que o teste será executado.',
        name: 'exec_device'
        ),
      choice(
        choices: ['headless', 'graphic'],
        description: 'Modo gráfico que teste será executado. ',
        name: 'graphic_mode'
        ),
      choice(
        choices: ['remote', 'local'],
        description: 'Executar o teste no Zalenium ou no Jenkins.',
        name: 'exec_mode'
        ),
      choice(
        choices: ['@regression', '@smoke'],
        description: 'Suítes de teste que podem ser executadas.',
        name: 'tags'
        ),
      choice(
        choices: ['master'],
        description: 'Branch a partir da qual os testes serão executados',
        name: 'branch'
        ),
    ]
  )
])
pipeline{
  agent any
  stages {
    stage('Clonando repositório principal') {
      steps {
        checkout([
            $class: 'GitSCM', 
            branches: [[name: "$branch"]], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [], 
            submoduleCfg: [], 
            userRemoteConfigs: [[
                credentialsId: 'jenkins-credentials', 
                url: 'https://github.com/esionti/magazine_luiza.git'
            ]]
        ])
      }
    }
    stage('Executando testes') {
      agent { 
          dockerfile {
              any
          }
      }
    steps {
    script {
      try {
      sh "rake test[$brand_environment,$exec_device,$exec_mode,$graphic_mode,$tags]"
      currentBuild.result = 'SUCCESS'
      } catch (Exception e) {
      currentBuild.result = 'FAILURE'
      }  
    }
      }
    }
    stage('Gerando relatórios') {
      steps {
        allure includeProperties: false, jdk: 'jdk8', results: [[path: 'allure-results']]
      }
    }
  }
}
