Rails.application.routes.draw do
    
    root 'static_pages#home'
    get 'help'  => 'static_pages#home'
    get 'about' => 'static_pages#help'
    get 'contact' => 'static_pages#help'
    get 'signup' => 'users#new'
    resources :users
end