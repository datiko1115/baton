class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end 

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :price, :condition_id, :recipient_id, :prefecture_id, :shipment_id,).merge(user_id: current_user.id)
  end
end
