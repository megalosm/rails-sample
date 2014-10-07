class CreateNewsTopics < ActiveRecord::Migration
  def change
    create_table :news_topics do |t|
      t.string :title
      t.text :context
      t.text :short_context
      t.boolean :top_news
      t.integer :comment_count,     :default => 0
      t.integer :like_count,        :default => 0
      t.integer :creator_id

      t.timestamps
    end

    add_index :news_topics, :creator_id
  end
end
