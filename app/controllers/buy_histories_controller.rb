class BuyHistoriesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @item = Item.find_by(id: params[:format]) #ネットを元に記述
  end

  def create
    
  end

end
