Rails.application.routes.draw do
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'animals#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :animals do
    resources :diets, except: :index
    resources :documents do
      get :download, on: :member
    end
  end
  
  match '/update_image' => 'animals#update_image', :via => :post, :as => :animals_update_image
  
  mount DocumentUploader.derivation_endpoint => "/derivations/image"
  # mount ImageUploader.derivation_endpoint => "/derivations/image"
  mount Shrine.uppy_s3_multipart(:cache) => "/s3/multipart"
  
  get 'documents/uploaded_images', to: 'documents#serve_uploaded_images', as: 'request_uploaded_images'
  
  
  #GET '/animals/showEntry'
  get 'users/index'
  match 'users/:id' => 'users#update', :via => :patch, :as => :users_update
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :users_destroy
  get '/update_form' => "application#update_form_partial", as: :update_form
  get 'users/index_partial', to: 'users#serve_index_partial', as: 'request_index_partial'
  
  #Redirect non-existent routes to animals index page  
  match '/*paths', :to => 'animals#index', via: [:get, :post]


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
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
