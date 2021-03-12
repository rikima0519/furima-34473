require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '入力漏れがなければ購入できる' do
        expect(@address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it '郵便番号の入力がないと購入できない' do
        binding.pry
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '都道府県の入力がないと購入できない' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '市区町村の入力がないと購入できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '番地の入力がないと購入できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include
      end

      it '電話番号の入力がないと購入できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include
      end
    end
  end
end
