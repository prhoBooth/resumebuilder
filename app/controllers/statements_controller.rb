class StatementsController < ApplicationController
  def index
    @statements = Statement.all

    render("statements/index.html.erb")
  end

  def show
    @statement = Statement.find(params[:id])

    render("statements/show.html.erb")
  end

  def new
    @statement = Statement.new

    render("statements/new.html.erb")
  end

  def create
    @statement = Statement.new

    @statement.user_id = params[:user_id]
    @statement.body = params[:body]
    @statement.type = params[:type]

    save_status = @statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/statements/new", "/create_statement"
        redirect_to("/statements")
      else
        redirect_back(:fallback_location => "/", :notice => "Statement created successfully.")
      end
    else
      render("statements/new.html.erb")
    end
  end

  def edit
    @statement = Statement.find(params[:id])

    render("statements/edit.html.erb")
  end

  def update
    @statement = Statement.find(params[:id])

    @statement.user_id = params[:user_id]
    @statement.body = params[:body]
    @statement.type = params[:type]

    save_status = @statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/statements/#{@statement.id}/edit", "/update_statement"
        redirect_to("/statements/#{@statement.id}", :notice => "Statement updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Statement updated successfully.")
      end
    else
      render("statements/edit.html.erb")
    end
  end

  def destroy
    @statement = Statement.find(params[:id])

    @statement.destroy

    if URI(request.referer).path == "/statements/#{@statement.id}"
      redirect_to("/", :notice => "Statement deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Statement deleted.")
    end
  end
end