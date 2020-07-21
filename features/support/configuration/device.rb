module Configuration
  class Device
    attr_reader :options

    def initialize(device, graphic_mode)
      @options = Selenium::WebDriver::Chrome::Options.new
      headless_options if graphic_mode == 'headless'
      default_options
    end

    def hash_options
      @options.options
    end

    def headless_options
      @options.add_argument('headless')
      @options.add_argument('disable-gpu')
    end

    def default_options
      @options.add_argument('ignore-certificate-errors')
      @options.add_argument('disable-popup-blocking')
      @options.add_argument('disable-web-security')
      @options.add_argument('disable-infobars')
      @options.add_argument('--start-maximized')
    end
  end
end
