class UsersController < ApplicationController

  before_action :require_self, only: [:show]

  def require_self
    if current_user
      user = User.find_by_id(params[:id])
      if user.nil? || user.id != current_user.id
        flash[:errors] = ["You can't view that user"]
        redirect_to user_url(current_user)
      end
    else
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      flash[:errrors] = ["User was not found"]
    end
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
