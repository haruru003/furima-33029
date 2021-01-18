FactoryBot.define do
  factory :trading_record do
    post_code          { "111-1111" }
    prefecture_code_id { 2 }
    city               { テスト }
    house_number       { 0 }
    building_name      { テスト }
    phone_number       { 00000000000}
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
