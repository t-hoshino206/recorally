Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  root "cards#index"
  resources :users, only: [:edit, :update]
  resources :cards do
    resources :places, except: [:index]
  end
  resources :playlogs
end
