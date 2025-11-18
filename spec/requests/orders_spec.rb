require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:buyer) { FactoryBot.create(:user) }           # 購入者
  let(:seller) { FactoryBot.create(:user) }          # 出品者

  let(:item) { FactoryBot.create(:item, user: seller) }  # 出品者の商品

  before do
    sign_in buyer     # 買うのは buyer（ログインユーザー）
  end

  describe "GET /index" do
    it "ログインしていれば成功する" do
      get item_orders_path(item.id)
      expect(response).to have_http_status(:success)
    end
  end
end
