Rails.application.routes.draw do
  # resources :locations

  # root 'plans#new'
  # root 'users'
  # root :to => "devise/sessions#new"

  devise_for :users, skip: [:passwords, :registrations], :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  as :user do
    post 'users/password', to: 'devise/passwords#create', as: :user_password
    get 'users/password/new', to: 'devise/passwords#new', as: :new_user_password
    get 'users/password/edit', to: 'devise/passwords#edit', as: :edit_user_password
    # get '/users/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration
    post '/users', to: 'devise/registrations#create', as: :user_registration
    get '/users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    get '/users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    delete '/users', to: 'devise/registrations#destroy', as: ""
    put '/users', to: 'devise/registrations#update', as: ""
    # get '', to: '', as: :


  end
  # get 'signin', to: 'devise/sessions#new', as: :new_user_session
  get 'welcome/index'
  devise_for :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_for :users
  devise_scope :user do
    # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    authenticated :user do
      root :to => 'plans#new'
    end
    unauthenticated :user do
      # root :to => 'devise/registrations#new', as: :unauthenticated_root
      root :to => 'welcome#index', as: :unauthenticated_root
    end
  end




  resources :plans, except: [:edit, :update, :destroy]
  # resources :planners

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
