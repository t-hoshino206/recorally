class PlacesController < ApplicationController
  def create
    place = Place.create(place_params)
    redirect_to card_path(place.card_id)
  end

  private

  def place_params
    params.require(:place).permit(:name, :image, :menu, :prefecture, :address, :map).merge(card_id: params[:card_id])
  end
end
