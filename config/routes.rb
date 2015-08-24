Miamimarket::Application.routes.draw do

  get "users/superlogin"
  get "users/superlogin_complete" => "users#superlogin_complete"
	get "users/allusers"
  get "users/logout_complete"
	get "users/userprofile/:id" => "users#userprofile"
	get "users/userban/:id" => "users#userban"
	get "users/userunban/:id" => "users#userunban"
	get "users/useragent/:id" => "users#useragent"

	root "market#posts" 
  get "/:category" => "market#posts_category"
	get "market/about" => "market#about"
  get "market/show/:id" => "market#show"
  get "market/write"
  post "market/write_complete"
  get "market/edit/:id" => 'market#edit'
  post "market/edit_complete"
  get "market/delete_complete/:id" => "market#delete_complete"
	post "market/write_comment_complete"
	get "market/delete_comment_complete/:id" => "market#delete_comment_complete"

	get 'auth/:provider/callback' => 'users#fb_login'
	get "users/logout_complete" => "users#logout_complet"

	get "market/myposts" => "market#myposts"
	get "market/search" => "market#search"

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
