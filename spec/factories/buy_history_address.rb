FactoryBot.define do
  factory :buy_history_address do
    post_code                  { '954-0082' }
    prefecture_id              { 16 }
    city                       { '見附市' }
    address                    { '柳橋町213-5' }
    building_name              { 'テックアパート' }
    phone_number               { '09092052055' }
    token                      { 'abcdefg' }
  end
end
