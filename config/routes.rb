Rails.application.routes.draw do
    scope "(:locale)", locale: /en|fr/ do
        #User Routes
        devise_for :users

        #Page Routes
        root to: 'pages#index'
        get 'about', to: 'pages#about', as: 'about'
        get 'naturopathic_medicine', to: 'pages#naturopathic_medicine', as: 'naturopathic_medicine'

        #Mailer Routes
        post 'create_contact', to: 'contacts#create', as: 'create_contact'
    end
end
