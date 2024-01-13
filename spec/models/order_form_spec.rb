require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, product_id: @product.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空欄でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'product_idが空欄でなければ保存できる' do
        @order_form.product_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.post_code = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外かつ空欄でなければ保存できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空欄でなければ保存できる' do
        @order_form.municipalities = '横浜市'
        expect(@order_form).to be_valid
      end
      it '番地が空欄でなければ保存できる' do
        @order_form.street_address = '旭区１２３'
        expect(@order_form).to be_valid
      end
      it '建物名が空欄でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone_number = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空だと保存できない' do
        @order_form.product_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空欄だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空欄だと保存できないこと' do
        @order_form.municipalities = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空欄だと保存できないこと' do
        @order_form.street_address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空欄だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.phone_number = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.phone_number = 12_345_678_910_123_111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
