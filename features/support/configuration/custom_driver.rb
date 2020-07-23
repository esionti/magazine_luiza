module Configuration
  class CustomDriver
    attr_reader :selenium_driver
    def initialize(mode, device)
      @selenium_driver = if mode == 'local'
                           Capybara::Selenium::Driver.new(@app, browser: :chrome, options: device.options)
                         end
    end
  end
end
