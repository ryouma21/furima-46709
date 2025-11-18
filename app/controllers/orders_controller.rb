class OrdersController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_sold_out, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(
      :postal_code, :prefecture_id, :city,
      :house_number, :building_name, :phone_number
    ).merge(
      user_id: current_user.id,
      item_id: params[:item_id],
      token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # ← 秘密鍵
    Payjp::Charge.create(
      amount: @item.price,                 # 商品の価格
      card: purchase_params[:token],       # トークン
      currency: 'jpy'
    )
  end

  def redirect_if_sold_out
    # 出品者は購入できない
    if current_user.id == @item.user_id
      redirect_to root_path
      return
    end

    # 売却済みも購入できない
    if @item.purchase.present?
      redirect_to root_path
      return
    end
  end
end
