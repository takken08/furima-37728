class Product < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :delivery_day


  validates :item_name, :explanation, :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, :selling_price, :image, presence: true
  validates :item_name, length: { maximum: 40, message: 'please enter within 40 characters' }
  validates :explanation, length: { maximum: 1000, message: 'please enter within 1000 characters' }
  validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "please enter the price from 300 yen to 9,999,999 yen in half-width digit" }
  validates :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
