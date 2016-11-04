class PresentationsController < ApplicationController

  def show
    @presentation = Presentation.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @presentation = @user.presentations.create(presentation_params)
    byebug
    if @presentation.save
      redirect_to user_presentation_path(@user, @presentation)
    else
      @errors = @presentation.errors.full_messages
      render 'new'
    end
  end

  def snapshot
    base_64_img = params[:pic]
    CreateImage.new(base_64_img).call
    GetEmotions.new().call
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name, :location, :audience, :start_time, :end_time, :notes)
  end


end
