module Utils
  extend RSpec::Matchers

  CALL_AND_ASSERT_FOR_EACH_IN_LIST = lambda do |list, a_method, validation|
    list.each do |item|
      expect(
        a_method.call(item)
      ).to validation
    end
  end

  def SITE_PRICE_TO_FLOAT(site_price)
    site_price.delete!('. R$')
    site_price.gsub!(',', '.')
    site_price.to_f
  end
  module_function :SITE_PRICE_TO_FLOAT
end
