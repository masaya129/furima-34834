class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :category_id,       presence: true
  validates :item_status_id,    presence: true
  validates :delivery_price_id, presence: true
  validates :delivery_area_id,  presence: true
  validates :delivery_date_id,  presence: true
  validates :genre_id, numericality: { other_than: 1 }
end
