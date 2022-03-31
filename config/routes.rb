Rails.application.routes.draw do
  devise_for :users
  root "cards#index"
  resources :cards, only: [:index, :new, :create, :show] do
    resources :places, only: [:new, :create, :show]
  end
end
