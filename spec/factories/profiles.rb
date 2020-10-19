FactoryBot.define do
  factory :profile do
    name             {"チャンネルch漢字"}
    explanation      {"これはテストです。単価10万"}
    insta_follower   {"20000"}
    insta_man        {"50"}
    insta_woman      {"50"}
    insta_age1       {"10"}
    insta_age2       {"10"}
    insta_age3       {"10"}
    insta_age4       {"10"}
    insta_age5       {"20"}
    insta_age6       {"20"}
    insta_age7       {"20"}
    insta_reach      {"9000"}
    insta_impression {"400"}
    insta_click      {"20"}
    youtube_follower {"10000"}
    twitter_follower {"10000"}
    category_id      {"2"}
    association :user
    after(:build) do |profile|
      profile.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
