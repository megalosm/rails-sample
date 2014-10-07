class NewsTopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_user_role
  before_action :set_news_topic, :only => [:show, :edit, :update, :destroy]

  # GET /news_topics
  # GET /news_topics.json
  def index
    @news_main_topics = NewsTopic.includes(:creator).order('id DESC').limit(10)
    @top_news = NewsTopic.top_news.order('id DESC').limit(10)
  end

  def show_more_news_topic
    @news_topics = NewsTopic.includes(:creator).where(
        'news_topics.id < ?', params[:last_topic_id].to_i
    ).order('news_topics.id DESC').limit(10)
  end

  # GET /news_topics/new
  def new
    @news_topic = NewsTopic.new
  end

  # GET /news_topics/1/edit
  def edit
    @news_topic.context.gsub!('</br>', "\n")
    @news_topic.short_context.gsub!('</br>', "\n")
  end

  # POST /upload_news_topic_image
  def upload_news_topic_image
    @news_topic_image = NewsTopicImage.new
    @news_topic_image.topic_image = params[:topic_image_upload]
    @news_topic_image.save
  end

  # GET /preview_news_topic
  def preview_news_topic
    @news_topic_context = params[:news_topic_context]
    @news_topic_context.gsub!("\n", '</br>')
    @news_topic_short_context = params[:news_topic_short_context]
    @news_topic_short_context.gsub!("\n", '</br>')
  end

  # POST /news_topics
  # POST /news_topics.json
  def create
    @news_topic = NewsTopic.new(news_topic_params)
    @news_topic.context.gsub!("\n", '</br>')
    @news_topic.short_context.gsub!("\n", '</br>')
    @news_topic.creator = current_user

    respond_to do |format|
      if @news_topic.save
        format.html { redirect_to news_topics_path, :notice => 'News topic was successfully created.' }
        format.json { render :show, :status => :created, :location => @news_topic }
      else
        format.html { render :new }
        format.json { render :json => @news_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_topics/1
  # PATCH/PUT /news_topics/1.json
  def update
    news_topic_params[:context].gsub!("\n", '</br>')
    news_topic_params[:short_context].gsub!("\n", '</br>')

    respond_to do |format|
      if @news_topic.update(news_topic_params)
        format.html { redirect_to news_topics_path, :notice => 'News topic was successfully updated.' }
        format.json { render :show, :status => :ok, :location => @news_topic }
      else
        format.html { render :edit }
        format.json { render :json => @news_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news_topics/1
  # DELETE /news_topics/1.json
  def destroy
    @news_topic.destroy
    respond_to do |format|
      format.html { redirect_to news_topics_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news_topic
    @news_topic = NewsTopic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_topic_params
    params.require(:news_topic).permit(:title, :context, :short_context, :top_news)
  end

  def verify_user_role
    redirect_to root_path if current_user.role != User::ADMIN_USER
  end
end
