Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :lists, only: [:index, :show, :create, :update, :destroy]
    resources :todos, only: [:index, :show, :create, :update, :destroy]
  end
end
