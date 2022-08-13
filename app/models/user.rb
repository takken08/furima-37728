class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buys

  Valid_password = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  Valid_name_zenkaku = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  Valid_name_kana = /\A[ァ-ヶー－]+\z/

  validates :nickname,            presence: true
  validates :password,            format: { with: Valid_password, message: 'Please enter in alphanumerical characters.'}
  with_options presence: true do
    validates :last_name,           format: { with: Valid_name_zenkaku, message: 'Please enter in Full-width characters.' }
    validates :first_name,          format: { with: Valid_name_zenkaku, message: 'Please enter in Full-width characters.' }
    validates :last_name_katakana,  format: { with: Valid_name_kana, message: 'Please enter in katakana characters' }
    validates :first_name_katakana, format: { with: Valid_name_kana, message: 'Please enter in katakana characters' }
  end
  validates :date_of_birth,       presence: true
end
