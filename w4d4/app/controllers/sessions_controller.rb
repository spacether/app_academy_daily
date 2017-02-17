class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # gets the user and logs them in
    user = User.find_by_credentials(params[:email], params[:password])
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["User was not found"]
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    flash[:errors] = ["You have been logged out"]
    redirect_to new_session_url
  end

end
