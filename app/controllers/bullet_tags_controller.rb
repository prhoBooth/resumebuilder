class BulletTagsController < ApplicationController
  def index
    @bullet_tags = BulletTag.all

    render("bullet_tags/index.html.erb")
  end

  def show
    @bullet_tag = BulletTag.find(params[:id])

    render("bullet_tags/show.html.erb")
  end

  def new
    @bullet_tag = BulletTag.new

    render("bullet_tags/new.html.erb")
  end

  def create
    @bullet_tag = BulletTag.new

    @bullet_tag.bullet_id = params[:bullet_id]
    @bullet_tag.tag_id = params[:tag_id]

    save_status = @bullet_tag.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bullet_tags/new", "/create_bullet_tag"
        redirect_to("/bullet_tags")
      else
        redirect_back(:fallback_location => "/", :notice => "Bullet tag created successfully.")
      end
    else
      render("bullet_tags/new.html.erb")
    end
  end

  def edit
    @bullet_tag = BulletTag.find(params[:id])

    render("bullet_tags/edit.html.erb")
  end

  def update
    @bullet_tag = BulletTag.find(params[:id])

    @bullet_tag.bullet_id = params[:bullet_id]
    @bullet_tag.tag_id = params[:tag_id]

    save_status = @bullet_tag.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bullet_tags/#{@bullet_tag.id}/edit", "/update_bullet_tag"
        redirect_to("/bullet_tags/#{@bullet_tag.id}", :notice => "Bullet tag updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bullet tag updated successfully.")
      end
    else
      render("bullet_tags/edit.html.erb")
    end
  end

  def destroy
    @bullet_tag = BulletTag.find(params[:id])

    @bullet_tag.destroy

    if URI(request.referer).path == "/bullet_tags/#{@bullet_tag.id}"
      redirect_to("/", :notice => "Bullet tag deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bullet tag deleted.")
    end
  end
end
