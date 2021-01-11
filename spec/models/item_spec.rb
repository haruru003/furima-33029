require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品の出品ができるとき" do
      it "商品名と商品の説明、カテゴリ、商品の状態、送料の負担、発送もとの地域、発送までの日数、価格、が正しく存在すると登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do 
      it "商品名が空だと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it "商品の説明が空だと出品できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Introduction can't be blank")
      end
      it "カテゴリーを選択しないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it "商品の状態を選択しないと出品できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item condition must be other than 1")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Postage payer must be other than 1")
      end
      it "配送元の都道府県を選択しないとしゅっ品できない" do
        @item.prefecture_code_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture code must be other than 1")
      end
      it "発送までの日数を選ばないと出品できない" do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Preparation day must be other than 1")
      end
      it "価格が空白だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it "価格は３００円以上でないと出品できない" do
        @item.price = 50
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it "価格は９９９９９９９円以下でないと出品できない" do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
       end
      it "価格は半角英語だけでは登録できない" do
        @item.price = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格は全角文字では登録できない" do
        @item.price = "あ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格は半角英数混合では登録できない" do
        @item.price = "a1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
