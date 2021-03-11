class BuyHistoriesController < ApplicationController
  before_action :authenticate_user!
  def index
     @item = Item.find(params[:item_id])
     if current_user.id == @item.user_id
        redirect_to root_path #自分の商品の購入ページに手動で入ってもrootに飛ばされる
    end
     @buy_history_address = BuyHistoryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_history_address = BuyHistoryAddress.new(buy_history_params)
    if @buy_history_address.valid?
      pay_item
      @buy_history_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

    private

  def buy_history_params #?
    params.require(:buy_history_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_history_params[:token],   
      currency: 'jpy'                 
    )
  end
end