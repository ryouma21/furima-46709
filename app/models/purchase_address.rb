class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id,
                :postal_code, :prefecture_id, :city, :house_number,
                :building_name, :phone_number

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
