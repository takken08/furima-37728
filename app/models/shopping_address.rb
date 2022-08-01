class ShoppingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area, :municipality, :house_number, :building_name, :phone_number, :user_id, :product_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :building_name
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: "Only half-width alphanumcric characters between 10 and 11 digits can be saved."}
    validates :user_id
    validates :product_id
  end
  validates :area, numericality: {other_than: 0, message: "can't be blank"}
end