FactoryBot.define do
  factory :post do
    name {'テスト名前'}
    description {'テキストテキストテキスト'}
    category_id {1}
    price {2000}
    # association :user
  end
end
