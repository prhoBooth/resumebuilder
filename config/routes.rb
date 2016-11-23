Rails.application.routes.draw do
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
