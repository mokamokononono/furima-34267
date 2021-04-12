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
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it '重複したnick_nameが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nick_name = @user.nick_name
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Nick name has already been taken"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
    end
  end
end
