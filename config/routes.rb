Rails.application.routes.draw do
    
    root 'sessions#new'
    get 'help'  => 'static_pages#home'
    get 'about' => 'static_pages#help'
    get 'contact' => 'static_pages#help'
    get 'signup' => 'users#new'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    resources :users
    
end