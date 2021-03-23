class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,    presence: true
  validates :concept,  presence: true
  validates :category_id, presence: true
  validates :delivery_price_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_date_id, presence: true
  validates :price,             presence: true
  validates :image,             presence: true
end
