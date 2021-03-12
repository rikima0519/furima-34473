require 'rails_helper'

RSpec.describe BuyHistoryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user) # 保存も
    @item = FactoryBot.create(:item)
    @buy_history_address = FactoryBot.build(:buy_history_address, item_id: @item.id, user_id: @user.id) # 生成のみ
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '入力漏れがなければ購入できる' do
        expect(@buy_history_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @buy_history_address.building_name = ''
        expect(@buy_history_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it '郵便番号の入力がないと購入できない' do
        @buy_history_address.post_code = ''
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @buy_history_address.post_code = '9540082'
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号は半角以外だと購入できない' do
        @buy_history_address.post_code = '９５４−００８２'
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県の入力がないと購入できない' do
        @buy_history_address.prefecture_id = 0
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村の入力がないと購入できない' do
        @buy_history_address.city = ''
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地の入力がないと購入できない' do
        @buy_history_address.address = ''
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号の入力がないと購入できない' do
        @buy_history_address.phone_number = ''
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上だと購入できない' do
        @buy_history_address.phone_number = '090123456789'
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it '電話番号が英数混合だと購入できない' do
        @buy_history_address.phone_number = "0909205abcd"
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Phone number is not a number")
      end

      it 'user_idが空だと購入できない' do
        @buy_history_address.user_id = nil
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @buy_history_address.item_id = nil
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'カード情報がないと購入できない' do
        @buy_history_address.token = nil
        @buy_history_address.valid?
        expect(@buy_history_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
