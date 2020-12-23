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
      it "conditionがないとitemは保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "shippingがないとitemは保存できない" do
        @item.shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      it "prefectureがないとitemは保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "pdayがないとitemは保存できない" do
        @item.pday_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Pday is not a number")
      end
      it "priceがないとitemは保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "imageがないとitemは保存できない" do
        @item.image = nil
        @item.valid?
        binding.pry
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
