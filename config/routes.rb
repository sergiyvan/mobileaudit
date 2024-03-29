Mobileaudit::Application.routes.draw do
  get "staticpages/show"
  get "users/my_user_data"
  #devise_for :users
  devise_for :users, :controllers => {:sessions => 'sessions', only: [:create]}
  resources :users

  post 'task_instances/take/:id', to: 'task_instances#take'
  post 'task_instances/cancel/:id', to: 'task_instances#cancel'
  post 'task_instances/update_changes_agent/:id', to: 'task_instances#update_changes_agent'
  get  'task_instances/my_tasks', to: 'task_instances#my_tasks'
  get  'task_instances/my_statistic', to: 'task_instances#my_statistic'
  post 'task_instances/:id/finished', to: 'task_instances#finished'
  resources :task_instances

  get 'tasks/show_possible_tasks', to: 'tasks#show_possible_tasks'
  resources :tasks do
    member do
      get :show_results
    end
  end

# Better way!!!!!!!!!! TODO
  resources :task_instances do
  #   collection do
  #     get  :my_tasks
  #     get  :my_statistic
  #   end
    member do
  #     post :take
  #     post :cancel
  #     post :update_changes_agent
      get :remaining_time
      get :finished
    end
  end

  # resources :tasks do
  #   collection do
  #     get :show_possible_tasks
  #   end
  # end

  resources :payouts

  root to: redirect('/tasks')



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
