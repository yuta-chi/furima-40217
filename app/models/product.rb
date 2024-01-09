class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # activestorageアソシエーション
  has_one_attached :image
  # active hushアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :product_coundition
  belongs_to :delivery_cost
  belongs_to :shipping_date
end
