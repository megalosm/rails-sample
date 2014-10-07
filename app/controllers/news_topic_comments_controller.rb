class NewsTopicCommentsController < ApplicationController
  before_action :set_news_topic_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show_news_topic_comments]

  def show_news_topic_comments
    @news_topic_comments = NewsTopicComment.includes(:creator).where(
        'news_topic_id = ?', params[:news_topic_id]
    ).order('id')
  end

  def like_news_topic
    news_topic_user_like = NewsTopicUserLike.new
    news_topic_user_like.news_topic_id = params[:news_topic_id]
    news_topic_user_like.user_id = current_user.id

    if news_topic_user_like.save
      @news_topic = NewsTopic.select('id, like_count').find(params[:news_topic_id])
    end
  end

  # GET /news_topic_comments/1/edit
  def edit
  end

  # POST /news_topic_comments
  # POST /news_topic_comments.json
  def create
    @news_topic_comment = NewsTopicComment.new(news_topic_comment_params)
    @news_topic_comment.creator_id = current_user.id
    @news_topic_comment.creator_ip = current_user.current_sign_in_ip

    respond_to do |format|
      if @news_topic_comment.save
        @news_topic_comments = NewsTopicComment.where(
            'news_topic_id = ?', @news_topic_comment.news_topic_id
        ).order('id')

        format.js { render :show_news_topic_comments }
        # format.html { redirect_to @news_topic_comment, notice: 'News topic comment was successfully created.' }
        # format.json { render :show, status: :created, location: @news_topic_comment }
      else
        # format.html { render :new }
        # format.json { render json: @news_topic_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_topic_comments/1
  # PATCH/PUT /news_topic_comments/1.json
  def update
    respond_to do |format|
      if @news_topic_comment.update(news_topic_comment_params)
        format.html { redirect_to @news_topic_comment, notice: 'News topic comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_topic_comment }
      else
        format.html { render :edit }
        format.json { render json: @news_topic_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_topic_comments/1
  # DELETE /news_topic_comments/1.json
  def destroy
    @news_topic_comment.destroy
    respond_to do |format|
      format.html { redirect_to news_topic_comments_url, notice: 'News topic comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_news_topic_comment
    @news_topic_comment = NewsTopicComment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_topic_comment_params
    params.require(:news_topic_comment).permit(:news_topic_id, :context)
  end
end
