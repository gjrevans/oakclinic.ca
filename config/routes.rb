Rails.application.routes.draw do
    # User Routes
    # Explicitly override the registrations conroller to allow additional params
    devise_for :users, controllers: { registrations: 'registrations' }

    # Page Routes
    root to: 'pages#index'
    get 'about', to: 'pages#about', as: 'about'
    get 'naturopathic_medicine', to: 'pages#naturopathic_medicine', as: 'naturopathic_medicine'

    # Article Routes
    resources :articles

    # Mailer Routes
    post 'create_contact', to: 'contacts#create', as: 'create_contact'
end
