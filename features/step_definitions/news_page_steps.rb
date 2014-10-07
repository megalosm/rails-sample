Given(/^Web have (\d+) news$/) do |arg|
  @news_topics = FactoryGirl.create_list(:news_topic, arg.to_i)
end

When(/^I click news content$/) do
  @news_topic = @news_topics.sample
  first('.context', :text => @news_topic.short_context).click
end

Then(/^I should can see news detail$/) do
  expect(page).to have_content(@news_topic.context)
end

When(/^I click top news link$/) do
  @news_topic = @news_topics.sample
  find('#top_new_panel').find('a', :text => @news_topic.title).click
end

And(/^I access to news detail page$/) do
  @news_topic = @news_topics.first
  visit "/news/#{@news_topic.id}"
end

When(/^I comment to news context$/) do
  @news_comment = NewsTopicComment.new(:context => Faker::Lorem.sentence)
  fill_in 'Comment', :with => @news_comment.context
  click_button 'Post'
end

Then(/^I should can see my comment in news detail page$/) do
  expect(page).to have_content(@news_comment.context)
end

Then(/^I should see like icon is active and count up$/) do
  expect(page).to have_selector('.user_liked')
  expect(find('.count_like').text).to eq(NewsTopic.find(@news_topic.id).like_count.to_s)
end

When(/^I click like button$/) do
  find('.like_count').click
end

When(/^I click comment button$/) do
  find('.comment_count').click
end

And(/^First news have (\d+) comments$/) do |arg|
  @news_topic = @news_topics.first
  @news_topic_comments = FactoryGirl.create_list(:news_topic_comment, arg.to_i, :news_topic => @news_topic)
end

Then(/^I should can see news topic comments$/) do
  @news_topic_comments.each do |comment|
    expect(page).to have_content(comment.context)
  end
end