Rails.application.routes.draw do

  get 'welcome/index'
  get 'articles/country'
  get 'articles/country_list'
  get 'articles/edit_country'
  get 'articles/resource'
  get 'articles/resource_list'
  get 'articles/category'
  get 'articles/category_list'
  get 'articles/update_country'
  get 'articles/add_country'
  get 'articles/delete_country'
  get 'articles/edit_resource'
  get 'articles/delete_resource'
  get 'articles/delete_category'
  get 'articles/add_resource'
  get 'articles/add_category'
  get 'articles/show_availresource'
  get 'articles/new_availresource'
  get 'articles/delete_availresource' 
  get 'articles/add_availresource'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :articles
  resources :articletwos
  root 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

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
