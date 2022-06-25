class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :item_state, :delivery_charge, :area, :delivery_day

  validates :item_name, :explanation, :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, :selling_price, presence: true
  validates :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
end
