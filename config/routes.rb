RsvuPortal::Application.routes.draw do
  

  get 'hardware_models/index'

  get 'hardware_models/show'

  get 'hardware_models/create'

  get 'hardware_models/update'

  get 'hardware_types/index'

  get 'hardware_types/show'

  get 'hardware_types/create'

  get 'hardware_types/update'

  get "hardware_reservations/new"
  get "hardware_reservations/index"
  get "hardware_reservations/create"
  get "hardwares/new"
  get "hardwares/index"
  get "search_hardwares", to: "hardwares#search"
  get "search_vms", to: "vms#search"
  
  get "show_reservable", to: "hardwares#show_reservable"
  get "show_reservable", to: "vms#archive"
  

  resources :hardware_models, only: [:show, :edit, :destroy, :update]
	
	resources :software_types
	resources :licenses
	resources :archives
	
  resources :hardware_types do
    resources :hardware_models, only: [:new, :create]
  end
    
  resources :hardware_models do 
    resources :hardwares, only: [:new, :create]
  end
  
  resources :group_relations, only: [:create]
  resources :users
  resources :groups do
    get "search_hardwares", to: "hardwares#search"
    resources :group_relations, only: [:create]
  end


  resources :sessions, only: [:new, :create, :destroy]
  resources :hardwares
  resources :events
	resources :reservations, only: [:destroy]
	resources :user_messages, only: [:destroy, :edit, :update]
  
  
  
  resources :vmhosts, only: [:index, :show]
  
  resources :vmhosts do
  	resources :vms
  	
  end
  resources :vms do
  	member do
    	get 'archive'
  	end
  	resources :reservations
  	resources :user_messages
  end
  
  resources :hardwares do
  	resources :reservations
  	resources :group_relations, only: [:new, :create]
    resources :devices
  	resources :softwares
  	resources :user_messages
  end
  
  root 'static_pages#home'
  match '/signup',		to: 'users#new',						via: 'get'
  match '/help',			to: 'static_pages#help',	via: 'get'
  match '/about',			to: 'static_pages#about',	via: 'get'
  match '/contact',		to: 'static_pages#contact',	via: 'get'
  match '/signin',		to: 'sessions#new',		via: 'get'
  match '/signout',		to:	'sessions#destroy',		via: 'delete'
  
 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"  delete "hardware_reservations/destroy"
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
