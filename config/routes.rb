Rails.application.routes.draw do
  devise_for :users
    root to: "pages#index"
    #resources :contacts, only: [:new, :create]
end
