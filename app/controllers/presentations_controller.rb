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
    CreateImage.new(image: base_64_img).call
    GetEmotions.new().call
    ResponseLogic.new.average(response)
  end

  def run
    @presentation = Presentation.find_by(id: params[:id])
    render 'run'
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name, :location, :audience, :start_time, :end_time, :notes)
  end


end
