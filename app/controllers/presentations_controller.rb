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
    create_image

    render :json => new_result(get_emotions)
  end


  private

  def new_result(response)
    new_result = Result.new(presentation_id: params[:id])

    new_result.update(ResponseLogic.new.average(response))
    new_result = Result.find_by(presentation_id: params[:id]).last unless new_result.save

    new_result.width
  end

  def get_emotions
    JSON.parse(GetEmotions.new.call)
  end

  def create_image
    base_64_img = params[:pic]
    CreateImage.new(image: base_64_img).call
  end

  def presentation_params
    params.require(:presentation).permit(:name, :location, :audience, :start_time, :end_time, :notes)
  end


end
