class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } # 半角英数字

  validates :family_name, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } # 全角

  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } # 全角

  validates :family_name_kana, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カナ

  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カナ

  validates :birth_day, presence: true
         # has_many :products
         # has_many :comments

        # validates :name, presence: true
end
