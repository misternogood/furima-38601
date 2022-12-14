class OrderShopper
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code,
              format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id,
              numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :addresses
    validates :phone_number,
              numericality: { only_integer: true },
              length: { in: 10..11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shopper.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
