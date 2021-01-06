FactoryBot.define do
  factory :user do
    username              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    first_name            {'てすと'}
    last_name             {'てすとてすと'}
    first_name_kana       {'テスト'}
    last_name_kana        {'テストテスト'}
    birthday              {'2000/1/1'}
  end
end