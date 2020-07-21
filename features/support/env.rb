require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require_relative 'configuration/ready_to_register_driver'
require_relative 'helper.rb'

World(Helper)

PATH_MASSA = File.dirname(__FILE__) + '/massa/'

Capybara.register_driver :site_prism do |app|
  Configuration::ReadyToRegisterDriver.new(app,
                                           device: ENV['DEVICE'],
                                           graphic_mode: ENV['GRAPHIC_MODE'],
                                           mode: ENV['MODE']).driver
end

Capybara.configure do |config|
  config.default_driver = :site_prism
  config.default_max_wait_time = 20
  config.app_host = ENV['HOST']
end
