Rails.application.routes.draw do
  root 'mustships#index'
  get '/desktop', to: 'mustships#index_desktop'
end
