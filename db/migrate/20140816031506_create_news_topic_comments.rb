class CreateNewsTopicComments < ActiveRecord::Migration
  def change
    create_table :news_topic_comments do |t|
      t.integer :news_topic_id
      t.text :context
      t.integer :creator_id
      t.string :creator_ip

      t.timestamps
    end

    add_index :news_topic_comments, :news_topic_id
    add_index :news_topic_comments, :creator_id
  end
end
