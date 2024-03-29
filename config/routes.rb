Rails.application.routes.draw do
  get 'home/index'
  
  get 'terms/index'
  get 'abouts/index'
  get 'articles/list'
  get 'articles/index'

  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  get 'articles/:id', to: 'articles#show', as: 'article'

  patch 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resource :articles, only: [:new, :create, :edit, :update, :destroy], path_names: { :new => '' }

  resource :contacts, only: [:new, :create], path_names: { :new => '' }

  resources :terms
  resources :abouts

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
