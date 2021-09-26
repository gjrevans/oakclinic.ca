Rails.application.routes.draw do
    # User Routes
    # Explicitly override the registrations conroller to allow additional params
    devise_for :users, controllers: { registrations: 'registrations' }

    # Page Routes
    root to: 'pages#index'
    get 'about', to: redirect("/")
    get 'contact', to: 'pages#contact'
    get 'products', to: 'pages#products'
    get 'services', to: 'pages#services'
    get 'iv-therapy', to: 'pages#iv_therapy'
    get 'neurostructural-integration-technique', to: 'pages#nst', as: 'nst'
    get 'naturopathy', to: 'pages#naturopathy'
    get 'team', to: 'pages#team'

    # Redirect List
    get 'iv_therapy', to: redirect("iv-therapy"), status: 301
    get 'faq', to: redirect("naturopathy"), status: 301

    # Article Routes
    resources :articles

    # Sitemap
    resource :sitemap, only: :show

    # Mailer Routes
    post 'create_contact', to: 'contacts#create', as: 'create_contact'
end
