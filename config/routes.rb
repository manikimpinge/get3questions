Questions::Application.routes.draw do
  ActiveAdmin.routes(self)

  mount DjMon::Engine => 'dj_mon'

  resources :invitations

  get "static_pages/home"

  get "static_pages/about"

  get "static_pages/facebook"

  get "static_pages/widgetsamples"

  get "static_pages/whyreviews"

  get "static_pages/resourcesforwebdesigners"

  get "static_pages/pricing"

  get "static_pages/local_search_report"

  match '/get_fb_token' => 'users#get_fb_token'
  match '/connect_to_facebook' => 'users#connect_to_facebook'

  #When using the FB app approach
  #match '/auth/:provider/callback', to: 'facebook_sessions#create'
  #match '/auth/failure', to: 'facebook_sessions#failure'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :profiles do

    resources :reviews
    member do
      get :image_previews
    end

    resources "widgets", only: [] do
      collection do
        get "detail"
        get "summary"
      end
    end

    member do
      post :save_product_question
      post :save_page_header
      post :save_page_color
      delete :delete_image
      post :add_review_site
    end
    collection do
      post :follow_up_email
      post :resend_email
      post :yelp_score
      post :yelp_score_value
    end
  end

  resources :static_pages do
    collection do
      post :verify_payment
      get :get_payment
      post :contact_us_query
    end

    member do
      get :iframe_box
    end
  end

  resources :reviews do
    collection do
      post :on_off_product_question
    end
  end
 
  root to: 'static_pages#home'

  #root to: 'profiles#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
