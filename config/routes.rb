Ita::Application.routes.draw do

  resources :locations do
    resources :maps
  end

  resources :trips do
    resources :maps
  end

  resources :outlines

  resources :maps

  resources :maps do
    resources :outlines
  end

  # resources :maps do
  #   resources :trips
  #   resources :locations
  # end

  resources :users 
  
  resources :sessions,      only: [:new, :create, :destroy]
  # resources :projects#,    only: [:create, :destroy, :show, :edit]
  
  root to: 'sessions#new'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
end
