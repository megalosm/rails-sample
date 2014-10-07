class CreateNewsTopicImages < ActiveRecord::Migration
  def change
    create_table :news_topic_images do |t|
      t.integer :news_topic_id
      t.string :original_file_name
      t.attachment :topic_image

      t.timestamps
    end

    add_index :news_topic_images, :news_topic_id
  end
end
