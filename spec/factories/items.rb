FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    shipping_id {2}
    prefecture_id {2}
    pday_id {2}
    price {1000}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
