require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "hoge00", password_confirmation: "hoge00", first_name: "下", last_name: "保", first_kana: "ゲ", last_kana: "ホ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "hoge00", password_confirmation: "hoge00", first_name: "", last_name: "保", first_kana: "ゲ", last_kana: "ホ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "hoge00", password_confirmation: "hoge00", first_name: "下", last_name: "", first_kana: "ゲ", last_kana: "ホ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_kanaが空だと登録できない" do
      user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "hoge00", password_confirmation: "hoge00", first_name: "下", last_name: "保", first_kana: "", last_kana: "ホ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank")
    end
    it "last_kanaが空だと登録できない" do
      user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "hoge00", password_confirmation: "hoge00", first_name: "下", last_name: "保", first_kana: "ゲ", last_kana: "", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "hoge00", password_confirmation: "hoge00", first_name: "下", last_name: "保", first_kana: "ゲ", last_kana: "ホ", birthday: "")
      user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
