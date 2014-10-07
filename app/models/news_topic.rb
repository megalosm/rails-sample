class NewsTopic < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :news_topic_images
  has_many :news_topic_comments
  has_many :news_topic_user_likes

  scope :top_news, -> { where(top_news: true) }

  def user_liked_this(user_id)
    NewsTopicUserLike.where(
        'news_topic_id = ? and user_id = ?', self.id, user_id
    ).exists?
  end
end
