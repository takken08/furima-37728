Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  resources :products, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :buy, only: [:index, :create]
  end
end
