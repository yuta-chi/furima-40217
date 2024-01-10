require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品登録' do
    context '出品登録ができる場合' do
      it '入力事項が存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @product.category_id = 1
        expect(@product).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @product.condition_id = 1
        expect(@product).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @product.delivery_cost_id = 1
        expect(@product).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @product.prefecture_id = 1
        expect(@product).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @product.shipping_date_id = 1
        expect(@product).to be_valid
      end
      it '価格が半角数字であれば登録できる' do
        @product.price = 5000
        expect(@product).to be_valid
      end
      it '価格が300円〜9,999,999円であれば登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
    end

    context '出品登録ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @product.user_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '１枚画像がないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空欄だと出品できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが「---」だと出品できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーが空欄だと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態が「---」だと出品できない' do
        @product.condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition must be other than 0')
      end
      it '商品の状態が空欄だと出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end
      it '配送料の負担が「---」だと出品できない' do
        @product.delivery_cost_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery cost must be other than 0')
      end
      it '配送料の負担が空欄だと出品できない' do
        @product.delivery_cost_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost can't be blank", 'Delivery cost is not a number')
      end
      it '発送元の地域が「---」だと出品できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送元の地域が空欄だと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '発送までの日数が「---」だと出品できない' do
        @product.shipping_date_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping date must be other than 0')
      end
      it '発送までの日数が空欄だと出品できない' do
        @product.shipping_date_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank", 'Shipping date is not a number')
      end
      it '価格が空欄だと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格が、300円未満だと出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が、9,999,999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
