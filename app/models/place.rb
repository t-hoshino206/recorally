class Place < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true
  validates :image, presence: true
  validates :menu, presence: true
  validates :prefecture_id, numericality: {other_than: 1, message: "が選択されていません"}
  validates :address, presence: true

  has_many :playlogs
  belongs_to :card
  has_one_attached :image
end
