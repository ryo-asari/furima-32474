require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'itemの保存' do
    before do
      @item = FactoryBot.build(:item)
    end

    context "itemが保存できる場合" do
      it "titleとexplanationとcategoryとconditionとshippingとprefectureとpdayとpriceとimageがあればツイートは保存される" do
        expect(@item).to be_valid
      end
    end

    context "itemが保存できない場合" do
      it "titleがないとitemは保存できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end     
      it "explanationがないとitemは保存できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "categoryがないとitemは保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "category_idが1の場合は登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "conditionがないとitemは保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "condition_idが1の場合は登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "shippingがないとitemは保存できない" do
        @item.shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      it "shipping_idが1の場合は登録できない" do
        @item.shipping_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it "prefectureがないとitemは保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "prefecture_idが0の場合は登録できない" do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "pdayがないとitemは保存できない" do
        @item.pday_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Pday is not a number")
      end
      it "pday_idが1の場合は登録できない" do
        @item.pday_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Pday must be other than 1")
      end
      it "priceがないとitemは保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字の場合は登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字のみで入力して下さい")
      end
      it "priceが299円以下の場合は登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10_000_000円以上の場合は登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "imageがないとitemは保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "userが紐付いていないとitemは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
