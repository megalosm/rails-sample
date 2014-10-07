class NewsTopicUserLike < ActiveRecord::Base
  belongs_to :news_topic
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :news_topic_id

  after_create :count_news_topic_user_like

  private
  def count_news_topic_user_like
    news_topic = self.news_topic
    news_topic.update_attribute(:like_count, news_topic.news_topic_user_likes.count)
  end
end
