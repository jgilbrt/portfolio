Rails.application.routes.draw do
  get 'pages/about'

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#about"

# config/routes.rb

  get '/contact', to: 'pages#contact'
  post '/contact', to: 'pages#send_contact'
  get "about", to: "pages#about"
  get '/projects/partial/:name', to: 'projects#show_partial', as: 'project_partial'
  get '/experience', to: 'pages#experience', as: 'experience'

  resources :projects

end
