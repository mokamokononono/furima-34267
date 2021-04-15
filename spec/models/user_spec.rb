require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_nameとemail、passwordとpassword_confirmation, kanji_family_nameとkanji_given_name, katakana_family_nameとkatakana_given_name, date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nick name can't be blank"
      end
      it 'kanji_family_nameが空では登録できない' do
        @user.kanji_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kanji family name can't be blank"
      end
      it 'kanji_given_nameが空では登録できない' do
        @user.kanji_given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kanji given name can't be blank"
      end
      it 'katakana_family_nameが空では登録できない' do
        @user.katakana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Katakana family name can't be blank"
      end
      it 'katakana_given_nameが空では登録できない' do
        @user.katakana_given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Katakana given name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it '重複したnick_nameが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nick_name = @user.nick_name
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Nick name has already been taken'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it '名字は漢字・ひらがな・カタカナ以外では登録できない' do
        @user.kanji_family_name = 'Hawking'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kanji family name is invalid. Input full-width characters.'
      end
      it '名前は漢字・ひらがな・カタカナ以外では登録できない' do
        @user.kanji_given_name = 'Michael'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kanji given name is invalid. Input full-width characters.'
      end
      it '名字（ふりがな）はカタカナ以外では登録できない' do
        @user.katakana_family_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Katakana family name is invalid. Input full-width katakana characters.'
      end
      it '名前（ふりがな）はカタカナ以外では登録できない' do
        @user.katakana_given_name = 'はなこ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Katakana given name is invalid. Input full-width katakana characters.'
      end
      it 'パスワードは英字のみでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefj'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width number & characters.'
      end
      it 'パスワードは数字のみでは登録できない' do
        @user.password = '1234567890'
        @user.password_confirmation = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width number & characters.'
      end
      it 'パスワードは全角では登録できない' do
        @user.password = '全角のパスワード'
        @user.password_confirmation = '全角のパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width number & characters.'
      end
      it 'emailに@が含まれていない場合、登録できないこと' do
        @user.email = 'sample.samp.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
    end
  end
end
