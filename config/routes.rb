Rails.application.routes.draw do
  devise_for :users
  root "cards#index"
  resources :cards do
    resources :places, except: [:index]
  end
end
