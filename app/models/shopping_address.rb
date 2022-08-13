class ShoppingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/,length: {minimum: 10, maximum: 11} , message: "is invalid. Only half-width alphanumcric characters between 10 and 11 digits can be saved."}
    validates :product_id
    validates :user_id
    validates :token
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy = Buy.create(product_id: product_id, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, house_number: house_number, phone_number: phone_number, buy_id: buy.id)
  end
end