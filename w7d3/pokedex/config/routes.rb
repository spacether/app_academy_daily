Rails.application.routes.draw do
  namespace :api do
  get 'pokemon_controller/index'
  end

  namespace :api do
  get 'pokemon_controller/show'
  end

  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :pokemon, except: [:edit, :new]
  end

end
