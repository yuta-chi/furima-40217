class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    order = Order.create(user_id:, product_id:)
    ShippingInformation.create(order_id: order.id, post_code:, prefecture_id:,
                               municipalities:, street_address:, building_name:, phone_number:)
  end
end
