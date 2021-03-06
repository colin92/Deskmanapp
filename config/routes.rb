Deskmanapp::Application.routes.draw do
  devise_for :users
  devise_scope :user do 
    # root to: 'static_pages#home'
    get '/users/sign_out' => 'devise/sessions#destroy'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
  root "static#calendar"
  get "shifts/create_shifts"
  post "shifts/create_shifts" => "shifts#created_shifts"
  resources :shifts
  resources :users
  get "sessions/new"
  resources :sessions
  get "static/Split_Shift"
  get "shifts/Split_Shift" => redirect("static/Split_Shift")
  get "static/take_shift" => "static#take_shift"
  get "static/sub_shift" => "static#sub_shift"
  get "static/calendar"
  get "static/home"
  # get "sign_up" => "users#new"
  # get "log_in" => "sessions#new"
  # get "log_out" => "sessions#destroy"



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
