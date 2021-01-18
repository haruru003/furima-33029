class OrderAdress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く
  
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_code_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = TradingRecord.create(item_id: item_id, user_id: user_id)
    adress = Adress.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, trading_record_id: order.id)
  end
end
