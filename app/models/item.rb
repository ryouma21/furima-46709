class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end
