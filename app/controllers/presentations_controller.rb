class PresentationsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @presentation = Presentation.find_by(id: params[:id], user_id: @user.id)

    redirect_to root_path unless @user == current_user && @presentation
  end

  def new
    @user = User.find(params[:user_id])
    redirect_to root_path unless @user == current_user
  end

  def create
    @user = User.find(params[:user_id])
    redirect_to root_path unless @user == current_user
    @presentation = @user.presentations.create(presentation_params)
    if @presentation.save
      redirect_to user_presentation_path(@user, @presentation)
    else
      @errors = @presentation.errors.full_messages
      render 'new'
    end
  end

  def run
    @user = User.find(params[:user_id])
    @presentation = Presentation.find_by(id: params[:id], user_id: @user.id)

    if @user != current_user
      redirect_to root_path
    else
      render :run_error if @presentation.finished
    end
  end

  def snapshot
    presentation = Presentation.find_by(id: params[:id])
    presentation.update(time_taken: params[:time_taken])

    create_image
    render :json => new_result(get_emotions)
  end

  def destroy
    user = User.find(params[:user_id])
    current_presentation.destroy

    redirect_to user_path(user)
  end

  def update
    @user = current_user
    @presentation = Presentation.find_by(id: params[:id])
    @presentation.update(finished: true)

    render :js => "window.location = '#{user_presentation_path}'"
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
    something = params[:time_taken]
    CreateImage.new(image: base_64_img).call
  end

  def presentation_params
    params.permit(:name, :location, :audience, :start_time, :end_time, :notes)
    ParseNewPresentation.new(params).return_formatted_params
  end
end
