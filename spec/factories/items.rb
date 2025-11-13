FactoryBot.define do
  factory :item do
    name              { "テスト商品" }
    description       { "説明テキスト" }
    category_id       { 2 }
    condition_id      { 2 }
    shipping_fee_id   { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    price             { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')), 
        filename: 'test_image.png',
        content_type: 'image/png'
        )
    end
  end
end
