class CardsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :card_set, only: [:show, :edit, :update, :destroy]

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
    @places = Place.where(card_id: @card.id).order(created_at: "ASC")
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to card_path
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to root_path
  end

  private

  def card_set
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :category_id).merge(user_id: current_user.id)
  end

  def card_place_params
    params.require(:card_place).permit(:title, :description, :category_id, :name, :menu, :prefecture_id, :address, :map, :image).merge(user_id: current_user.id)
  end
end