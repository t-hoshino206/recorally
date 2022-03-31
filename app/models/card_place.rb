class CardPlace
  include ActiveModel::Model
  attr_accessor :title, :description, :category, :name, :image, :menu, :prefecture, :address, :map, :user_id

  validates :title, presence: true
  validates :description, presence: true
  validates :category, numericality: {other_than: 0, message: "can't be blank"}
  validates :name, presence: true
  validates :image, presence: true
  validates :menu, presence: true
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  validates :address, presence: true

  def save
    card = Card.create(title: title, description: description, category: category, user_id: user_id)
    Place.create(name: name, menu: menu, prefecture: prefecture, address: address, map: map, image: image, card_id: card.id)
  end
end