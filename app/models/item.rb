class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image
  has_one_attached :buy_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :by_send

  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :by_send_id
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :by_send_id
  end
  validates :price, numericality: true
end
