FactoryBot.define do
  factory :user do
    nickname              { 'fox' }
    email                 { 'test@test.com' }
    password              { 'Shota1993' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    kana_last_name        { 'タナカ' }
    kana_first_name       { 'タロウ' }
  end
end
