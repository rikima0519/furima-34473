class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]
  before_action :after_buy_root, only: [:edit, :update]
  before_action :search_item, only: [:index, :search]

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
  end

  def update
    if @item.update(item_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to action: 'index'
  end

  def search
    @results = @i.result.includes(:category)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :category_id, :status_id, :cost_id, :prefecture_id, :by_send_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def after_buy_root
    redirect_to root_path if @item.buy_history.present?
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def search_item
    @i = Item.ransack(params[:q])
  end
end
