class ItemsController < ApplicationController
 
 before_action :authenticate_user!
  def index
    # @items = Item.order('created_at DESC')
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: 'index'
    else
      render 'new'
     end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :category_id, :status_id, :cost_id, :prefecture_id, :by_send_id, :image).merge(user_id: current_user.id)
  end
end
