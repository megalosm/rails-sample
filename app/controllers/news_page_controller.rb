class NewsPageController < ApplicationController

  def index
    @news_topics = NewsTopic.select(
        'id, title, short_context, comment_count, like_count, creator_id, created_at'
    ).includes(:creator).order('id DESC').limit(10)
    @top_news = NewsTopic.select('id, title').top_news.order('id DESC').limit(10)
  end

  def show_more_news_topic
    @news_topics = NewsTopic.select(
        'id, title, short_context, comment_count, like_count, creator_id, created_at'
    ).includes(:creator).where(
        'news_topics.id < ?', params[:last_topic_id].to_i
    ).order('news_topics.id DESC').limit(10)
  end

  def show_news_topic
    @news_topic = NewsTopic.includes(:creator).find(params[:news_topic_id])
    @top_news = NewsTopic.select('id, title').top_news.order('id DESC').limit(10)

    @news_topic_comment = NewsTopicComment.new
  end
end
