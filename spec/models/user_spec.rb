require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "登録できるとき" do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    
      it "emailに＠があれば登録できる" do
        expect(@user.email).to include('@')
      end

      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end

      it "半角英数字が混合されていれば登録ができる" do
        @user.password = "aaaa11"
        @user.valid?
        # binding.pry
        expect(@user.errors_full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordとpassword_confirmationが合致すれば登録できる" do
        expect(@user.password).to eq(@user.password_confirmation)
      end
    end
    context "登録できないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
  
      it "last_name_katakanaが空では登録できない" do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
  
      it "first_name_katakanaが全角(カタカナ)でなければ登録できない" do
        @user.first_name_katakana = 'kあ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana full width characters")
      end
  
      it "last_name_katakanaが全角(カタカナ)でなければ登録できない" do
        @user.last_name_katakana = 'kあ阿'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana full width characters")
      end
  
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end      
    end
  end  
end
