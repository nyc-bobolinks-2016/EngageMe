class UsersController < ApplicationController

  before_action :authorize, :except => [:index, :new, :create]

  def new
  end

  def welcome
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless @user == current_user
    @current_presentations = @user.current_presentations
    @past_presentations = @user.past_presentations
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :organization, :password, :password_confirmation)
  end

end
