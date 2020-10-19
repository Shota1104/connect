FactoryBot.define do
  factory :message do
    content   {"こんにちは"}
    association :user
    association :room
    after(:build) do |profile|
      profile.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end