# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_topic_comment do
    news_topic
    creator { User.first || FactoryGirl.create(:user) }
    context { Faker::Lorem.sentence }
  end
end