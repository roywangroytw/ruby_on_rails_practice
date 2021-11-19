Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "pages#index" 
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  get "/sign_up", to: "accounts#sign_up"
  post "/sign_up/registering", to: "accounts#registering"

  get "/login", to: "accounts#login"
  post "/login/account_checking", to: "accounts#account_checking"

end
