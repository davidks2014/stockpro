Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :locations do
    post "update_materials", to: "update_materials#update"
    get "updatematerials", to: "update_materials#show"
    post "update_stock", to: "update_materials#updatestock"
    get "material_usage", to: "update_materials#material_usage", as: "material_usage"
    get "stockcount", to: "update_materials#stockcount", as: "stockcount"
    get "stockalert", to: "update_materials#stockalert", as: "stockalert"

  end

  post '/locations/:location_id/stockcount_update', to: 'update_materials#stockcount_update', as: 'stockcount_update'
  post '/locations/:location_id/stockalert_update', to: "update_materials#stockalert_update", as: "stockalert_update"
  get "/locations/:location_id/stockcount_report", to: "locations#stockcount_report", as: "stockcount_report"
  get "/locations/:location_id/show_low_stock", to: "locations#show_low_stock", as: "show_low_stock"
  get "/locations/:location_id/item_requests_approval", to: "item_requests#approval", as: "item_requests_approval"


  post 'materials/importnew', to: 'materials#import', as: 'material_import'

  get 'materials/import', to: 'materials#import', as: 'import'
  resources :materials, except: [:show]

  resources :item_requests, only: %i[] do
    post 'eng_approve', to: 'item_requests#eng_approve'
    post 'eng_decline', to: 'item_requests#eng_decline'
    post 'man_approve', to: 'item_requests#man_approve'
    post 'man_decline', to: 'item_requests#man_decline'
    collection do
      get 'status/:del_approv_status', to: 'item_requests#del_approv_status', as: 'del_approv_status'
    end
  end

  # resources :materials

  resources :requests, only: %i[index new create show]
  resources :delivery_orders, only: %i[index create] do
    post 'receive', to: 'delivery_orders#receive'

  end

  resources :sites, only: %i[index show new create]

  resources :update_materials


end
