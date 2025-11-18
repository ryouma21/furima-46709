class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id,
                :postal_code, :prefecture_id, :city, :house_number,
                :building_name, :phone_number, :token

   # ▼ バリデーション
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  # 郵便番号（3桁-4桁）
   validates :postal_code, format: { 
    with: /\A\d{3}-\d{4}\z/,
    message: "is invalid. Enter it as follows (e.g. 123-4567)" 
  }

  # 都道府県（---=1 を選ばせない）
  validates :prefecture_id, numericality: { 
    other_than: 1, 
    message: "can't be blank" 
  }

  # 電話番号（10〜11桁の数字のみ）
  validates :phone_number, format: { 
    with: /\A\d{10,11}\z/,
    message: "is invalid. Input only number"
  }

  # 保存処理
  def save
    # purchase の保存
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id
    )

    # address の保存
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end
