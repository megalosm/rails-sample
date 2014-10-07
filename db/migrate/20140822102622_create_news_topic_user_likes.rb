class CreateNewsTopicUserLikes < ActiveRecord::Migration
  def change
    create_table :news_topic_user_likes do |t|
      t.integer :news_topic_id
      t.integer :user_id

      t.timestamps
    end

    add_index :news_topic_user_likes, :news_topic_id
    add_index :news_topic_user_likes, :user_id
  end
end
