require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '12345a'
      #@user.encrypted_password = '12345b'
      @user.password_confirmation = '12345b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      #@user.encrypted_password = '1234a'      
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混合でないと登録できない' do
      #@user.password = '123456'
      #@user.encrypted_password = '123456'
      #@user.password_confirmation = '123456'
      #@user.valid?
      #expect(@user.errors.full_messages).to include("Encrypted password is invalid")
    end
    it '重複したemailが存在する場合は登録できない' do
      #@user.save
      #another_user = FactoryBot.build(:user)
      #another_user.email = @user.email
      #another_user.valid?
      #binding.pry
      #expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end

  describe '本人確認' do
    it 'name_firstが空では登録できない' do
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first can't be blank")
    end
    it 'name_lastが空では登録できない' do
      @user.name_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last can't be blank")
    end
    it 'name_first_kanaが空では登録できない' do
      @user.name_first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first kana can't be blank")
    end
    it 'name_last_kanaが空では登録できない' do
      @user.name_last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end