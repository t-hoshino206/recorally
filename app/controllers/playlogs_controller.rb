class PlaylogsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @playlog = Playlog.new(playlog_params)
    if @playlog.valid?
      @playlog.save
      redirect_to card_path(params[:card_id])
    else
      render :show
    end
  end

  private

  def playlog_params
    params.permit(:user_id, :place_id)
  end
end
