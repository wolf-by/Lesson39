Rails.application.routes.draw do
  
  root "articles#index"

  get "/articles", to: "articles#index"

  get 'home/index'
  
  
  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resource :contacts, only: [:new, :create], path_names: { :new => '' }
  
  resources :articles do
    resources :comments
  end

  resource :articles, only: [:show, :edit, :update, :destroy]
  #delete 'articles/:id', to: 'articles#destroy'
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end