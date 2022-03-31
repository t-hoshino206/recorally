class Place < ApplicationRecord
  belongs_to :card
  has_one_attached :image
end
