Rails.application.routes.draw do
  # Routes for the Saved_statement resource:
  # CREATE
  get "/saved_statements/new", :controller => "saved_statements", :action => "new"
  post "/create_saved_statement", :controller => "saved_statements", :action => "create"

  # READ
  get "/saved_statements", :controller => "saved_statements", :action => "index"
  get "/saved_statements/:id", :controller => "saved_statements", :action => "show"

  # UPDATE
  get "/saved_statements/:id/edit", :controller => "saved_statements", :action => "edit"
  post "/update_saved_statement/:id", :controller => "saved_statements", :action => "update"

  # DELETE
  get "/delete_saved_statement/:id", :controller => "saved_statements", :action => "destroy"
  #------------------------------

  # Routes for the Saved_bullet resource:
  # CREATE
  get "/saved_bullets/new", :controller => "saved_bullets", :action => "new"
  post "/create_saved_bullet", :controller => "saved_bullets", :action => "create"

  # READ
  get "/saved_bullets", :controller => "saved_bullets", :action => "index"
  get "/saved_bullets/:id", :controller => "saved_bullets", :action => "show"

  # UPDATE
  get "/saved_bullets/:id/edit", :controller => "saved_bullets", :action => "edit"
  post "/update_saved_bullet/:id", :controller => "saved_bullets", :action => "update"

  # DELETE
  get "/delete_saved_bullet/:id", :controller => "saved_bullets", :action => "destroy"
  #------------------------------

  # Routes for the Resume resource:
  # CREATE
  get "/resumes/new", :controller => "resumes", :action => "new"
  post "/create_resume", :controller => "resumes", :action => "create"

  # READ
  get "/resumes", :controller => "resumes", :action => "index"
  get "/resumes/:id", :controller => "resumes", :action => "show"

  # UPDATE
  get "/resumes/:id/edit", :controller => "resumes", :action => "edit"
  post "/update_resume/:id", :controller => "resumes", :action => "update"

  # DELETE
  get "/delete_resume/:id", :controller => "resumes", :action => "destroy"
  #------------------------------

  # Routes for the Statement resource:
  # CREATE
  get "/statements/new", :controller => "statements", :action => "new"
  post "/create_statement", :controller => "statements", :action => "create"

  # READ
  get "/statements", :controller => "statements", :action => "index"
  get "/statements/:id", :controller => "statements", :action => "show"

  # UPDATE
  get "/statements/:id/edit", :controller => "statements", :action => "edit"
  post "/update_statement/:id", :controller => "statements", :action => "update"

  # DELETE
  get "/delete_statement/:id", :controller => "statements", :action => "destroy"
  #------------------------------

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
