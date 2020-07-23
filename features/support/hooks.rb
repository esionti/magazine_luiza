require 'report_builder'

Before do
  @app = App.new
end

Before do |scenario|
  Capybara.page.driver.browser.manage.window.maximize
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').gsub(/\W/, '').tr('/','_')
  if scenario.failed?
    tirar_foto(scenario_name.downcase!, 'falhou')
  else
    tirar_foto(scenario_name.downcase!, 'passou')
  end
end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'reports/features_report.json'
    config.report_path = 'reports/features_report'
    config.report_types = [:html]
    config.report_title = 'Magazine Luiza - Relatorio'
    config.color = 'green'
    config.compress_images = true
  end
  ReportBuilder.build_report
end
