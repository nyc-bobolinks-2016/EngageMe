class PresentationsController < ApplicationController

  def show
    @presentation = Presentation.find(params[:id])
  end

end
