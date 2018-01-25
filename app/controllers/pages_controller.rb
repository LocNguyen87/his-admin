class PagesController < ApplicationController
  def login
  end

  def index
    if !logged_in?
      flash[:error] = "You are not authorized to view dashboard"
      redirect_to root_path
    end
  end
end
