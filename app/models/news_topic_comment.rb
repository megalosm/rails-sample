class NewsTopicComment < ActiveRecord::Base
  belongs_to :news_topic
  belongs_to :creator, :class_name => 'User'

  after_create :count_news_topic_comments

  private
  def count_news_topic_comments
    news_topic = self.news_topic
    news_topic.update_attribute(:comment_count, news_topic.news_topic_comments.count)
  end
end
