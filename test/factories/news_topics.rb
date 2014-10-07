# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_topic do
    title { Faker::Lorem.sentence }
    context { Faker::Lorem.paragraph }
    short_context { Faker::Lorem.paragraph }
    top_news true
    creator { User.first }

    # factory :news_topic_with_main_topic do
    #   after(:create) do |news_topic, evaluator|
    #     create(:news_main_topic,
    #            :news_topic => news_topic,
    #            :title => news_topic.title,
    #            :context => news_topic.context,
    #            :creator => news_topic.creator)
    #   end
    # end
  end
end
