Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  resources :products do
    resources :buy, only: [:index, :create]
  end
end
