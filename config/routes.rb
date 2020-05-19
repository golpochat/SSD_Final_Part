Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'cart/index'
  resources :invoice_items
  resources :invoices
  resources :items
  root 'home#index'

  resources :users
  resources :sessions, only: %i[new create destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add', as: :cart_add
  get '/clear_cart' => 'cart#clear'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/checkout' => 'cart#checkout'
end
