class ItemsController < ApplicationController
  def index
    # アクションの処理を実装する
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
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end



end
