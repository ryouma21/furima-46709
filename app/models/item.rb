class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

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
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end  
   # 価格の制限
  validates :price,
  numericality: { 
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
