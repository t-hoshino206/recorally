class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :place_set, only: [:show, :edit, :update, :destroy]

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.valid?
      @place.save
      redirect_to card_path(params[:card_id])
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to card_place_path
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to card_path(params[:card_id])
  end

  private

  def place_set
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :image, :menu, :prefecture_id, :address, :map).merge(card_id: params[:card_id])
  end
end
