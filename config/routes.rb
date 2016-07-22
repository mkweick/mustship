Rails.application.routes.draw do
  root 'mustships#index'
  get '/desktop',             to: 'mustships#index_desktop'
  get '/update-data',         to: 'mustships#update_data'
  get '/update-data-desktop', to: 'mustships#update_data_desktop'
end
