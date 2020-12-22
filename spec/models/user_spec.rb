require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録がうまくいくとき" do
      it "nicknameとemail, passwordとpassword_confirmationとfirst_nameとlast_nameとfirst_kanaとlast_kanaとbirthdayがあれば存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordは6文字以上であれば登録できる" do
        @user.password = "hoge00"
        @user.password_confirmation = "hoge00"
        expect(@user).to be_valid
      end
      it "first_kanaは全角カタカナであれば登録できる" do
        @user.first_kana = "カタカナ"
        expect(@user).to be_valid
      end
      it "last_kanaは全角カタカナであれば登録できる" do
        @user.last_kana = "カタカナ"
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がないと登録できない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordがないと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは5文字以下では登録できない" do
        @user.password = "hoge0"
        @user.password_confirmation = "hoge0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "password:半角英数混合(半角英語のみ)" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password:半角英数混合(半角数字のみ)" do
        @user.password = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password:半角英数混合(全角のみ)" do
        @user.password = "ｈｏｇｅ００"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "hoge00"
        @user.password_confirmation = "hoge000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "Ge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = "Ho"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_kanaが空だと登録できない" do
        @user.first_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "first_kanaは全角平仮名では登録できない" do
        @user.first_kana = "げ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角カタカナのみで入力して下さい")
      end
      it "first_kanaは半角カタカナでは登録できない" do
        @user.first_kana = "ｹﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角カタカナのみで入力して下さい")
      end
      it "last_kanaが空だと登録できない" do
        @user.last_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it "last_kanaが全角平仮名では登録できない" do
        @user.last_kana = "ほ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナのみで入力して下さい")
      end
      it "last_kanaは半角カタカナでは登録できない" do
        @user.last_kana = "ﾎ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナのみで入力して下さい")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
