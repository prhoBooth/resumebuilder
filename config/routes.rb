Rails.application.routes.draw do
  # Routes for the Bullet_tag resource:
  # CREATE
  get "/bullet_tags/new", :controller => "bullet_tags", :action => "new"
  post "/create_bullet_tag", :controller => "bullet_tags", :action => "create"

  # READ
  get "/bullet_tags", :controller => "bullet_tags", :action => "index"
  get "/bullet_tags/:id", :controller => "bullet_tags", :action => "show"

  # UPDATE
  get "/bullet_tags/:id/edit", :controller => "bullet_tags", :action => "edit"
  post "/update_bullet_tag/:id", :controller => "bullet_tags", :action => "update"

  # DELETE
  get "/delete_bullet_tag/:id", :controller => "bullet_tags", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

  # Routes for the Bullet resource:
  # CREATE
  get "/bullets/new", :controller => "bullets", :action => "new"
  post "/create_bullet", :controller => "bullets", :action => "create"

  # READ
  get "/bullets", :controller => "bullets", :action => "index"
  get "/bullets/:id", :controller => "bullets", :action => "show"

  # UPDATE
  get "/bullets/:id/edit", :controller => "bullets", :action => "edit"
  post "/update_bullet/:id", :controller => "bullets", :action => "update"

  # DELETE
  get "/delete_bullet/:id", :controller => "bullets", :action => "destroy"
  #------------------------------

  # Routes for the Organization resource:
  # CREATE
  get "/organizations/new", :controller => "organizations", :action => "new"
  post "/create_organization", :controller => "organizations", :action => "create"

  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"

  # UPDATE
  get "/organizations/:id/edit", :controller => "organizations", :action => "edit"
  post "/update_organization/:id", :controller => "organizations", :action => "update"

  # DELETE
  get "/delete_organization/:id", :controller => "organizations", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
