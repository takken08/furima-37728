class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :delivery_day

  Valid_price_num = /\A[0-9]+\z/

  validates :item_name, :explanation, :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, :selling_price, :image, presence: true
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "please enter the price from 300 yen to 9,999,999 yen" }, format: { with: Valid_price_num, message: 'please enter in half-width digit' }
  validates :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
