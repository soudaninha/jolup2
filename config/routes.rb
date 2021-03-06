Rails.application.routes.draw do

  get 'tinymce_assets/create'

  root 'posts#index'
  get 'home/index'

  devise_for :users, controllers: { registrations: "registrations" }
  
  get '/new_notifications/read_all' => 'new_notifications#read_all'
  post '/tinymce_assets' => 'tinymce_assets#create'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    # sunspot  
    collection do
      get :search
    end
  end
  
  resources :teams do
    resources :teamrefs, only: [:create, :destroy]
  end
  
  resources :profiles
  
  get 'posts/search' => 'posts#search'
  
  resources :new_notifications, only: [:index, :show, :create]
  resources :members, only: [:create, :destroy]
  
 resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
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
