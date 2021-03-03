class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } # 半角英数字

  with_options presence: true do
     validates :nickname
     validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } # 全角
     validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } # 全角
     validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カナ
     validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カナ
     validates :birth_day
  end
end
