require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが既に登録されているものでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@がなければ登録できない' do
      @user.email = 's.rikima.icloud.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが６文字以上なら登録できる' do
      @user.password = '1a2b3c'
      @user.password_confirmation = '1a2b3c'
      expect(@user).to be_valid
    end

    it 'passwordは半角英数字が含まれていなければ登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが一致しなければ登録できない' do
      @user.password = '1a2b3c'
      @user.password_confirmation = '4d5e6f'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'ユーザー本名は、family_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'ユーザー本名は、first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名は、family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name = 'ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    it 'ユーザー本名は、first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'cd'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'ユーザー本名は、family_name_kanaが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'ユーザー本名は、first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'ユーザー本名のfamily_name_kanaは、全角（カタカナ）での入力がないと登録できない' do
      @user.family_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'ユーザー本名のfirst_name_kanaは、全角（カタカナ）での入力がないと登録できない' do
      @user.first_name_kana = '健太'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '生年月日がないと登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
