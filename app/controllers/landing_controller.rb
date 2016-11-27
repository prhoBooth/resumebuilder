class LandingController < ApplicationController

skip_before_action :authenticate_user!

  def landing
    render("welcome.html.erb")
  end

end
