class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  
  Valid_name_zenkaku = /\A[ぁ-んァ-ン一-龥]/
  Valid_name_kana = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :last_name,           format: { with: Valid_name_zenkaku, message: 'Please enter in Full-width characters.' }
    validates :first_name,          format: { with: Valid_name_zenkaku, message: 'Please enter in Full-width characters.' }
    validates :last_name_katakana,  format: { with: Valid_name_kana, message: 'Please enter in katakana characters' }
    validates :first_name_katakana, format: { with: Valid_name_kana, message: 'Please enter in katakana characters' }
  end
  validates :date_of_birth,       presence: true
end
