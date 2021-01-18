require 'rails_helper'

RSpec.describe OrderAdress, type: :model do
  before do
    @order_adress = FactoryBot.build(:order_adress)
  end

  describe "商品購入" do
    context "商品の購入ができるとき" do
      it "全ての情報が正しく入力されていれば購入できる" do
        expect(@order_adress).to be_valid
      end
      it "建物名が空欄でも購入できる" do
        @order_adress.building_name = ""
        expect(@order_adress).to be_valid
      end
    end
    context '商品の購入ができないとき' do 
      it "カード情報が空欄だと購入できない" do
        @order_adress.token = nil
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("Token can't be blank")
      end
      it "郵便番号が空白だと購入できない" do
        @order_adress.post_code = nil
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("Post code can't be blank")
      end
      it "郵便番号はハイフンがないと購入できない" do
        @order_adress.post_code = "1111111"
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県が選択されてないと購入できない" do
        @order_adress.prefecture_code_id = 1
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("Prefecture code can't be blank")
      end
      it "市区町村が空白だと購入できない" do
        @order_adress.city = ""
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("City can't be blank")
      end
      it "番地が空白だと購入できない" do
        @order_adress.house_number = ""
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("House number can't be blank")
      end
      it "電話番号が空白だと購入できない" do
        @order_adress.phone_number = ""
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include ("Phone number can't be blank")
      end
      it "電話番号は10,11けたでないと登録できない" do
        @order_adress.phone_number = "1111111111111"
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号はハイフンなしでないと購入できない" do
        @order_adress.phone_number = '111-1111-1111'
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は英数混合では登録できない" do
        @order_adress.phone_number = '111aaaa1111'
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end