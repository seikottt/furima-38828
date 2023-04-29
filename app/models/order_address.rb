class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building_name, :phone_num, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
    validates :token, presence: true
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 購入情報の保存
    order = Order.create(item_id: item_id, user_id: user_id)

    # 発送先情報の保存
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name,
                   phone_num: phone_num, order_id: order.id)
  end
end
