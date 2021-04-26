class ApplicationController < ActionController::Base
  
  def forex_home
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    symbols_hash = parsed_data.fetch("symbols")
    @currency_symbols = symbols_hash.keys

    render({:template => "forex_templates/forex_home.html.erb"})
  end

  def forex_base_currency
    url = "https://api.exchangerate.host/symbols"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    symbols_hash = parsed_data.fetch("symbols")
    @currency_symbols = symbols_hash.keys

    render({:template => "forex_templates/forex_base_currency.html.erb"})
  end

  def calculate_forex_rate
    url = "https://api.exchangerate.host/convert?from="+params.fetch("first_currency")+"&to="+params.fetch("second_currency")
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @rate = parsed_data.fetch("info").fetch("rate")
    
    render({:template => "forex_templates/forex_calculation.html.erb"})
  end

end
