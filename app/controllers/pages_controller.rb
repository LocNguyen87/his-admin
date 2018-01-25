class PagesController < ApplicationController
  def login
  end

  def index
    Parse::use_shortnames!
    if !logged_in?
      flash[:error] = "You are not authorized to view dashboard"
      redirect_to root_path
    end

    @registrations = Registration.all
  end

  def details
    Parse::use_shortnames!
    @registration = Registration.find(params[:id])
    render 'details'
  end
end
