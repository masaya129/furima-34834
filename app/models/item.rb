class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :concept
    validates :category_id
    validates :item_status_id
    validates :delivery_price_id
    validates :delivery_area_id
    validates :delivery_date_id
    validates :price, inclusion: { in: (300..9999999)}
    validates :image
  end
end
