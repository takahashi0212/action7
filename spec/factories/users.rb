FactoryBot.define do
  factory :user do
    nickname              {Faker::JapaneseMedia::OnePiece.character}
    email                 {Faker::Internet.free_email}
    password              {"aaaa1111"}
    password_confirmation {password}
  end
end
