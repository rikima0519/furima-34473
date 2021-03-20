require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録ができる時' do
      it 'passwordが６文字以上なら登録できる' do
        @user.password = '1a2b3c'
        @user.password_confirmation = '1a2b3c'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it 'emailが既に登録されているものでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@がなければ登録できない' do
        @user.email = 's.rikima.icloud.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordは英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordは全角だけでは登録できない' do
        @user.password = '東京理科大学'
        @user.password_confirmation = '東京理科大学'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = '1a2b3c'
        @user.password_confirmation = '4d5e6f'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end

  describe '新規登録/本人情報確認' do
    it 'ユーザー本名は、family_nameが空だと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it 'ユーザー本名は、first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'ユーザー本名は、family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name = 'ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end

    it 'ユーザー本名は、first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'cd'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end

    it 'ユーザー本名は、family_name_kanaが空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
    end

    it 'ユーザー本名は、first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
    end

    it 'ユーザー本名のfamily_name_kanaは、全角（カタカナ）での入力がないと登録できない' do
      @user.family_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
    end

    it 'ユーザー本名のfirst_name_kanaは、全角（カタカナ）での入力がないと登録できない' do
      @user.first_name_kana = '健太'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
    end

    it '生年月日がないと登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
