require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  before do
    @buy_history = FactoryBot.build(:buy_history)
  end
end
#消して良い？