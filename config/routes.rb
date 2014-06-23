Ita::Application.routes.draw do

  resources :outlines

  resources :maps

  resources :maps do
    resources :outlines
  end

  resources :users 
  
  resources :sessions,      only: [:new, :create, :destroy]
  # resources :projects#,    only: [:create, :destroy, :show, :edit]
  
  root to: 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
end
