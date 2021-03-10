class Address < ApplicationRecord
has_many :comments
belongs_to :buy_history
end
