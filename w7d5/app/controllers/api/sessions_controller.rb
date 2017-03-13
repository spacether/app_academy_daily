class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(*user_params.values)
    if @user
      login!(@user)
      render 'api/users/show'
    else
      render json: ["Invalid credentials"], status: 401
    end
  end

  def destroy
    if current_user
      @user = current_user
      logout!
      # render 'api/users/show'
      head :no_content
    else
      render json: ["No one is logged in"], status: 400
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
