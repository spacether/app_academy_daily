Rails.application.routes.draw do
 # Your routes here!
  namespace :api, defaults: { format: :json } do
    # Your routes here
    resources :gifts, only: [:show]
    resources :guests, only: [:index, :show] do
      resources :gifts, only: [:index]
    end

    resources :invitations, only: [:index, :show]
    resources :parties, only: [:index, :show]
  end
end
