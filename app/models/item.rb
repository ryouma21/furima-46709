class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
   # 必須項目
  validates :name,          presence: true
  validates :description,   presence: true
  validates :price,         presence: true
   # 画像
  validates :image,         presence: true
 # ActiveHashの必須チェック（---=1を選ばせない）
  validates :category_id,     numericality: { other_than: 1 }
  validates :condition_id,    numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
   # 価格の制限
  validates :price,
  numericality: { 
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
