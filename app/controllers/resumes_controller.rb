class ResumesController < ApplicationController
  before_action :current_user_must_be_resume_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_resume_user
    resume = Resume.find(params[:id])

    unless current_user == resume.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.resumes.ransack(params[:q])
      @resumes = @q.result(:distinct => true).includes(:user, :saved_bullets, :saved_statements, :bullets, :statements).page(params[:page]).per(10)

    render("resumes/index.html.erb")
  end

  def show
    @saved_statement = SavedStatement.new
    @saved_bullet = SavedBullet.new
    @resume = Resume.find(params[:id])

    render("resumes/show.html.erb")
  end

  def new
    @resume = Resume.new

    render("resumes/new.html.erb")
  end

  def create
    @resume = Resume.new

    @resume.user_id = params[:user_id]
    @resume.name = params[:name]

    save_status = @resume.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resumes/new", "/create_resume"
        redirect_to("/resumes")
      else
        redirect_back(:fallback_location => "/", :notice => "Resume created successfully.")
      end
    else
      render("resumes/new.html.erb")
    end
  end

  def edit
    @resume = Resume.find(params[:id])

    render("resumes/edit.html.erb")
  end

  def update
    @resume = Resume.find(params[:id])

    @resume.user_id = params[:user_id]
    @resume.name = params[:name]

    save_status = @resume.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/resumes/#{@resume.id}/edit", "/update_resume"
        redirect_to("/resumes/#{@resume.id}", :notice => "Resume updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Resume updated successfully.")
      end
    else
      render("resumes/edit.html.erb")
    end
  end

  def destroy
    @resume = Resume.find(params[:id])

    @resume.destroy

    if URI(request.referer).path == "/resumes/#{@resume.id}"
      redirect_to("/", :notice => "Resume deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Resume deleted.")
    end
  end
end
