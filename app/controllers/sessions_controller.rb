class SessionsController < ApplicationController

  def new
    debugger
    if !logged_in?
      render 'login'
    else
      redirect_to dashboard_path
    end
  end

  def create
    user = Parse::User.login(params[:session][:username], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid login data"
      render 'login'
    else
      session[:user_id] = user.id
      session[:session_token] = user.session_token
      flash[:success] = "You have successfully logged in."
      redirect_to dashboard_path
    end
  end

  def destroy
    if !logged_in?
      flash.now[:error] = "You did not logged in"
    else
      current_user.logout
      session[:user_id] = nil
      session[:session_token] = nil
      flash.now[:success] = "You have successfully logged out."
    end
    render 'login'
  end

  private
	def session_params
		params.require(:session).permit(:username, :password)
	end
end
