class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :info, presence: true, length: { maximum: 1000 }

  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999},presence: { messasge: "can't be blank"}

  validates :category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,:scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end
