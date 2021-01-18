require 'rails_helper'

RSpec.describe TradingRecord, type: :model do
  before do
    @trading_record = FactoryBot.build(:trading_record)
  end

  describe "商品購入" do
    context "商品の購入ができるとき" do
      it "全ての情報が正しく入力されていれば購入できる" do
        # expect(@trading_record).to be_valid
      end
    end
    context '商品の購入ができないとき' do 
      
    end
  end
end
