require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "ユーザー新規登録ができるとき" do
      it "usernamaとemailとpassword、firstname、lastname 、first＿name＿kana、last＿name_kanaが存在すると登録できる" do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができないとき' do 
      it "usernameが空だと登録できない" do
        @user.username = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Username can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it "emailが一意性である" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がないと登録できない" do
        @user.email ="a"
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it "passwordがないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは６文字以上ないと登録できない" do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = "00000000"
        @user.password_confirmation = "00000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは英語のみでは登録できない" do
        @user.password = "aaaaaaaa"
        @user.password_confirmation = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは全角のみでは登録できない" do
        @user.password = "ああああああああ"
        @user.password_confirmation = "ああああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword確認用が一致していないと登録できない" do
        @user.password = "0000aaaa"
        @user.password_confirmation = "0000bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameがないと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameがないと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameは全角でないと登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameは全角でないと登録できない" do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_kanaが空白だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空白だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaは全角カタカナでないと登録できない" do
        @user.first_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaは全角カタカナでないと登録できない" do
        @user.last_name_kana = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "生年月日が空白だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
    end
  end
end