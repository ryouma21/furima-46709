require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '全ての情報が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    end

    it '商品の説明が空では出品できない' do
      item = FactoryBot.build(:item, description: '')
      item.valid?
      expect(item.errors.full_messages).to include("Description can't be blank")
    end

    it '価格が空では出品できない' do
      item = FactoryBot.build(:item, price: '')
      item.valid?
      expect(item.errors.full_messages).to include("Price can't be blank")
    end

    it 'カテゴリーが --- では出品できない' do
      item = FactoryBot.build(:item, category_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態が --- では出品できない' do
      item = FactoryBot.build(:item, condition_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担が --- では出品できない' do
      item = FactoryBot.build(:item, shipping_fee_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include("Shipping fee must be other than 1")
    end

    it '発送元の地域が --- では出品できない' do
      item = FactoryBot.build(:item, prefecture_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数が --- では出品できない' do
      item = FactoryBot.build(:item, shipping_day_id: 1)
      item.valid?
      expect(item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it '価格が299円以下では出品できない' do
      item = FactoryBot.build(:item, price: 299)
      item.valid?
      expect(item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が10,000,000円以上では出品できない' do
      item = FactoryBot.build(:item, price: 10_000_000)
      item.valid?
      expect(item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格が全角数字だと出品できない' do
      item = FactoryBot.build(:item, price: '３００')
      item.valid?
      expect(item.errors.full_messages).to include('Price is not a number')
    end

    it '価格が半角数字以外では出品できない' do
      item = FactoryBot.build(:item, price: 'abc')
      item.valid?
      expect(item.errors.full_messages).to include('Price is not a number')
    end
  end
end