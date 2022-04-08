class Place < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :playlogs
  belongs_to :card
  has_one_attached :image
end
