class ProductsController < ApplicationController
  # ログインしていないユーザーはログインページに
  before_action :authenticate_user!, except: [:index]

  def index
    # アクションの処理を実装する
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :condition_id, :delivery_cost_id, :prefecture_id,
                                    :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
