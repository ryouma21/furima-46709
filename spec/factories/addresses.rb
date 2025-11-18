FactoryBot.define do
  factory :address do
    postal_code { 'MyString' }
    prefecture_id { 1 }
    city { 'MyString' }
    house_number { 'MyString' }
    building_name { 'MyString' }
    phone_number { 'MyString' }
    purchase { nil }
  end
end
