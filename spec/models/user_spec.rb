require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録のテスト' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が存在しなければ登録できないこと' do
      @user.email = 'aaahoge.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailに一意性がなければ登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordに全角が含まれていると登録できないこと' do
      @user.password = 'あbc123'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが半角数字のみだと登録できないこと' do
      @user.password = '123123'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが半角英字のみだと登録できないこと' do
      @user.password = 'abcabc'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが6文字未満であれば登録できないこと' do
      @user.password = '123ab'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationの値が異なれば登録できないこと' do
      @user.password_confirmation = '1234ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'family_nameに半角文字が含まれていたら登録できないこと' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name Full-width characters')
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameに半角文字が含まれていたら登録できないこと' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'family_name_readingが空では登録できないこと' do
      @user.family_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank")
    end

    it 'family_name_readingに半角文字が含まれていたら登録できないこと' do
      @user.family_name_reading = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name reading Full-width katakana characters')
    end

    it 'first_name_readingが空では登録できないこと' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it 'first_name_readingに半角文字が含まれていたら登録できないこと' do
      @user.first_name_reading = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading Full-width katakana characters')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
