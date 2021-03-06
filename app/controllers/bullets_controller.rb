class BulletsController < ApplicationController
  before_action :current_user_must_be_bullet_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_bullet_user
    bullet = Bullet.find(params[:id])

    unless current_user == bullet.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index


      @q = current_user.bullets.ransack(params[:q])
      @bullets = @q.result(:distinct => true).includes(:organization, :bullet_tags, :saved_bullets, :user, :tags, :resumes).page(params[:page]).per(10)
      @organizations = current_user.organizations

      if params[:tag_id]
      @bullet_tags = BulletTag.all.where(:tag_id => params[:tag_id]).pluck(:bullet_id)
      else
      @bullet_tags = nil
      end

      @bullets = @bullets.where(id: @bullet_tags)



    render("bullets/index.html.erb")
  end

  def show
    @saved_bullet = SavedBullet.new
    @bullet_tag = BulletTag.new
    @bullet = Bullet.find(params[:id])


    render("bullets/show.html.erb")
  end

  def new
    @bullet = Bullet.new

    render("bullets/new.html.erb")
  end

  def create
    @bullet = Bullet.new

    @bullet.organization_id = params[:organization_id]
    @bullet.user_id = params[:user_id]
    @bullet.body = params[:body]

    save_status = @bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bullets/new", "/create_bullet"
        redirect_to("/bullets")
      else
        redirect_back(:fallback_location => "/", :notice => "Bullet created successfully.")
      end
    else
      render("bullets/new.html.erb")
    end
  end

  def edit
    @bullet = Bullet.find(params[:id])

    render("bullets/edit.html.erb")
  end

  def update
    @bullet = Bullet.find(params[:id])

    @bullet.organization_id = params[:organization_id]
    @bullet.user_id = params[:user_id]
    @bullet.body = params[:body]

    save_status = @bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bullets/#{@bullet.id}/edit", "/update_bullet"
        redirect_to("/bullets/#{@bullet.id}", :notice => "Bullet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bullet updated successfully.")
      end
    else
      render("bullets/edit.html.erb")
    end
  end

  def destroy
    @bullet = Bullet.find(params[:id])

    @bullet.destroy

    if URI(request.referer).path == "/bullets/#{@bullet.id}"
      redirect_to("/", :notice => "Bullet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bullet deleted.")
    end
  end
end
