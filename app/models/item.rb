class Item < ApplicationRecord
   has_many :comments
   belongs_to :user
   has_one_attached :image

   extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :cost
    belongs_to :prefecture
    belongs_to :by_send



   with_options presence: true do

      validates :name   
      validates :explain
      validates :category_id, numericality: { other_than: 1 } 
      validates :status_id, numericality: { other_than: 1 } 
      validates :cost_id, numericality: { other_than: 1 } 
      validates :prefecture_id, numericality: { other_than: 1 } 
      validates :by_send_id, numericality: { other_than: 1 } 
      validates :price, numericality: { greater_than: 300, less_than: 9999999 }, format: { with: /^[0-9]+$/ }
      validates :image

   end
end
