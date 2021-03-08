class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show

  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    unless current_user.id == @item.user.id
      redirect_to root_path
    end

   if @item.update(item_params)
    redirect_to action: 'index'
   else
    render 'edit'
   end

  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :category_id, :status_id, :cost_id, :prefecture_id, :by_send_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
    redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
