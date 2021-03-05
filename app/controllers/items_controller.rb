class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    if user_signed_in?
    @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to action: "index"
    else
      render :new
    end
  end

private
def item_params
  params.permit(:name, :price, :explain, :category_id, :status_id, :cost_id, :prefecture_id, :by_send_id, :image).merge(user_id: current_user.id)

end   

end