class SavedStatementsController < ApplicationController
  def index
    @saved_statements = SavedStatement.all

    render("saved_statements/index.html.erb")
  end

  def show
    @saved_statement = SavedStatement.find(params[:id])

    render("saved_statements/show.html.erb")
  end

  def new
    @saved_statement = SavedStatement.new

    render("saved_statements/new.html.erb")
  end

  def create
    @saved_statement = SavedStatement.new

    @saved_statement.statement_id = params[:statement_id]
    @saved_statement.resume_id = params[:resume_id]

    save_status = @saved_statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_statements/new", "/create_saved_statement"
        redirect_to("/saved_statements")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved statement created successfully.")
      end
    else
      render("saved_statements/new.html.erb")
    end
  end

  def edit
    @saved_statement = SavedStatement.find(params[:id])

    render("saved_statements/edit.html.erb")
  end

  def update
    @saved_statement = SavedStatement.find(params[:id])

    @saved_statement.statement_id = params[:statement_id]
    @saved_statement.resume_id = params[:resume_id]

    save_status = @saved_statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_statements/#{@saved_statement.id}/edit", "/update_saved_statement"
        redirect_to("/saved_statements/#{@saved_statement.id}", :notice => "Saved statement updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved statement updated successfully.")
      end
    else
      render("saved_statements/edit.html.erb")
    end
  end

  def destroy
    @saved_statement = SavedStatement.find(params[:id])

    @saved_statement.destroy

    if URI(request.referer).path == "/saved_statements/#{@saved_statement.id}"
      redirect_to("/", :notice => "Saved statement deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved statement deleted.")
    end
  end
end
