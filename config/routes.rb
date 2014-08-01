Rails.application.routes.draw do
  root 'home#index'
  devise_for :organizations, path: '', :skip => [:registrations, :sessions]

  devise_scope :organization do
    get 'organizations/:id/edit' => 'organizations/registrations#edit'
    post 'organizations' => 'organizations/registrations#create', as: 'organization_registration'
    put 'organizations/:id' => 'organizations/registrations#update'
    patch 'organizations/:id' => 'organizations/registrations#update'

    get 'sign_in' => 'organizations/sessions#new'
    post 'sign_in' => 'organizations/sessions#create', :as => 'organization_session'

    delete 'sign_out' => 'devise/sessions#destroy', :as => 'destroy_organization_session'
  end

  devise_for :developer, path: '', controllers: { 
    omniauth_callbacks: 'github_callbacks',
  }

  devise_scope :developer do
    delete 'sign_out', to: 'devise/sessions#destroy', as: 'destroy_developer_session'
  end

  resources :developers
  resources :projects do
    resources :developer_projects, :only => :create
  end

  resource :projects do
    post 'search' => 'projects#search'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
