class UsersController < ApplicationController

  before_action :authorize, :except => [:index, :new]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless @user == @current_user
    @presentations = @user.presentations
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :organization, :password, :password_confirmation)
  end

end
