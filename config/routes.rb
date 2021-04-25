Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/forex", {:controller => "application", :action => "forex_home"})
  get("/forex/:first_currency", {:controller => "application", :action => "forex_base_currency"})
  get("/forex/:first_currency/:second_currency", {:controller => "application", :action => "calculate_forex_rate"})
  
end
