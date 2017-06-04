Rails.application.routes.draw do
    scope "(:locale)", locale: /en|fr/ do
        #User Routes
        devise_for :users

        #Page Routes
        root to: 'pages#index'
        get 'about', to: 'pages#about', as: 'about'
        get 'naturopathic_medicine', to: 'pages#naturopathic_medicine', as: 'naturopathic_medicine'

        #resources :contacts, only: [:new, :create]
    end
end
