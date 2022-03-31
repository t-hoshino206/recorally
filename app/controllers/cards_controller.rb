class CardsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :card_place_set, only: [:show]

  def index
    @cards = Card.order(created_at: "DESC")
  end

  def new
    @card_place = CardPlace.new
  end

  def create
    @card_place = CardPlace.new(card_place_params)
    if @card_place.valid?
      @card_place.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def card_place_set
    @card = Card.find(params[:id])
    @place = Place.find(params[:id])
  end

  def card_place_params
    params.require(:card_place).permit(:title, :description, :category, :name, :menu, :prefecture, :address, :map, :image).merge(user_id: current_user.id)
  end
end