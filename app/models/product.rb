class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # テーブルアソシエーション
  belongs_to :user
  # activestorageアソシエーション
  has_one_attached :image
  # active hushアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :shipping_date

  # 入力が必須
  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # 選択が「--」の時は保存できない
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :condition_id
    validates :delivery_cost_id
    validates :shipping_date_id
  end
end
