class SavedBulletsController < ApplicationController
  def index
    @saved_bullets = SavedBullet.page(params[:page]).per(10)

    render("saved_bullets/index.html.erb")
  end

  def show
    @saved_bullet = SavedBullet.find(params[:id])

    render("saved_bullets/show.html.erb")
  end

  def new
    @saved_bullet = SavedBullet.new

    render("saved_bullets/new.html.erb")
  end

  def create
    @saved_bullet = SavedBullet.new

    @saved_bullet.bullet_id = params[:bullet_id]
    @saved_bullet.resume_id = params[:resume_id]

    save_status = @saved_bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_bullets/new", "/create_saved_bullet"
        redirect_to("/saved_bullets")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved bullet created successfully.")
      end
    else
      render("saved_bullets/new.html.erb")
    end
  end

  def edit
    @saved_bullet = SavedBullet.find(params[:id])

    render("saved_bullets/edit.html.erb")
  end

  def update
    @saved_bullet = SavedBullet.find(params[:id])

    @saved_bullet.bullet_id = params[:bullet_id]
    @saved_bullet.resume_id = params[:resume_id]

    save_status = @saved_bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_bullets/#{@saved_bullet.id}/edit", "/update_saved_bullet"
        redirect_to("/saved_bullets/#{@saved_bullet.id}", :notice => "Saved bullet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved bullet updated successfully.")
      end
    else
      render("saved_bullets/edit.html.erb")
    end
  end

  def destroy
    @saved_bullet = SavedBullet.find(params[:id])

    @saved_bullet.destroy

    if URI(request.referer).path == "/saved_bullets/#{@saved_bullet.id}"
      redirect_to("/", :notice => "Saved bullet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved bullet deleted.")
    end
  end
end
