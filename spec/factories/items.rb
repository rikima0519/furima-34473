FactoryBot.define do
  factory :item do
    name                  { '財布' }
    price                 { 1000 }
    explain { 'ヴィトンの財布です！' }
    category_id            { 2 }
    status_id              { 2 }
    cost_id { 2 }
    prefecture_id { 2 }
    by_send_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
