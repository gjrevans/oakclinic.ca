Rails.application.routes.draw do
    # User Routes
    # Explicitly override the registrations conroller to allow additional params
    devise_for :users, controllers: { registrations: 'registrations' }

    # Page Routes
    root to: 'pages#index'
    get 'about', to: redirect("/")
    get 'contact', to: 'pages#contact', as: 'contact'
    get 'products', to: 'pages#products', as: 'products'
    get 'services', to: 'pages#services', as: 'services'
    get 'faq', to: 'pages#faq', as: 'faq'

    # Article Routes
    resources :articles

    # Mailer Routes
    post 'create_contact', to: 'contacts#create', as: 'create_contact'
end
