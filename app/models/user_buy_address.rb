class UserBuyAddress < ApplicationRecord
  
  
  belongs_to :user
  belongs_to :item
  has_one :buy_address
end
