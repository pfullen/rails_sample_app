Rails.application.routes.draw do
    
  resources :homilies
  get 'password_resets/new'

  get 'password_resets/edit'

  resources :users do
    member do
      get :following, :followers
    end
  end
    
  resources :sessions,      only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#home'
  get 'help'     => 'static_pages#help'    
  get 'about'    => 'static_pages#about'
  get 'contact'  => 'static_pages#contact'
  get 'signup'   => 'users#new'
  get 'login'    => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'=> 'sessions#destroy'
  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts,      only: [:create, :destroy]
  

end
    
    
