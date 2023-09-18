Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :locations

  post 'materials/importnew', to: 'materials#import', as: 'material_import'
  get 'materials/import', to: 'materials#import', as: 'import'
  resources :materials, except: [:show]

  resources :item_requests, only: %i[] do
    post 'eng_approve', to: 'item_requests#eng_approve'
    post 'eng_decline', to: 'item_requests#eng_decline'
    post 'man_approve', to: 'item_requests#man_approve'
    post 'man_decline', to: 'item_requests#man_decline'
  end

  # resources :materials

  resources :requests, only: %i[index new create show]
end
