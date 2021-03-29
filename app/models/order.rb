class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address_line, :delivery_area_id, :city, :block_number, :city_bill, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :address_line, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :delivery_area_id
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :token
  end
  


  # ここにバリデーションの処理を書く

  def save
    user_buy_address = UserBuyAddress.create(user_id: user_id, item_id: item_id)
    BuyAddress.create(address_line: address_line, delivery_area_id: delivery_area_id, city: city, block_number: block_number, city_bill: city_bill, phone_number: phone_number, user_buy_address: user_buy_address)
    # 各テーブルにデータを保存する処理を書く
  end
end