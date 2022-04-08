class CardPlace
  include ActiveModel::Model
  attr_accessor :title, :description, :category_id, :name, :image, :menu, :prefecture_id, :address, :map, :user_id

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: {other_than: 1, message: "が選択されていません"}
  validates :name, presence: true
  validates :image, presence: true
  validates :menu, presence: true
  validates :prefecture_id, numericality: {other_than: 1, message: "が選択されていません"}
  validates :address, presence: true

  def save
    card = Card.create(title: title, description: description, category_id: category_id, user_id: user_id)
    Place.create(name: name, menu: menu, prefecture_id: prefecture_id, address: address, map: map, image: image, card_id: card.id)
  end
end