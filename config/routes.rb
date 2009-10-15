ActionController::Routing::Routes.draw do |map|
  map.resources :dashboard

  map.resources :licenses

  map.resources :items

  #map.resources :boms
  map.resources :boms do |boms|
    boms.resources :items, :member => { :show_doc_version => :get,
              :cancel_edit_image => :get,
              :edit_image => :get,
              :update_image => :put,
              :create_attachment => :put,
              :delete_attachment => :delete,
              :show_choice => :get,
              :new_attachment => :get } do |items|
      items.resources :doc_versions
      items.resources :images
      items.resources :forums
    end    
  end
  #map.resources :projects
  map.resources :projects,
              :member => { :follow => :get,
                  :prepare_delete => :get,
                  :stop_following => :get,
                  :add_collaborator => :get,
                  :create_collaborator => :post,
                  :related_users => :get,
                  :status_history => :get,
                  :show_family_trees => :get,
                  :new_clone => :get,
                  :show_doc_version => :get,
                  :cancel_edit_image => :get,
                  :edit_image => :get,
                  :update_image => :put },
              :collection => { :auto_complete_for_user_login => :post } do |projects|
      projects.resources :doc_versions  
      projects.resources :boms
      projects.resources :forums
    end
 
  # Restful Authentication Rewrites
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.change_password '/change_password/:reset_code', :controller => 'passwords', :action => 'reset'
  map.open_id_complete '/opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create '/opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }
  
  # Restful Authentication Resources
  map.resources :users
  map.resources :passwords
  map.resource :session
  
  # Home Page
  map.root :controller => 'home', :action => 'index'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
