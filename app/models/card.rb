class Card < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: {other_than: 1, message: "が選択されていません"}

  belongs_to :user
  has_many :places, dependent: :destroy
end
