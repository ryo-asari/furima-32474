FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"下"}
    last_name {"保"}
    first_kana {"ゲ"}
    last_kana {"ホ"}
    birthday {"2000-01-01"}


  end
end