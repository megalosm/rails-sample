class NewsTopicImage < ActiveRecord::Base
  belongs_to :news_topic

  has_attached_file :topic_image, :styles => {:medium => '700x700>', :thumb => '100x100>'},
                    :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :topic_image, :content_type => /\Aimage\/.*\Z/

  before_create :randomize_file_name

  private
  def randomize_file_name
    extension = File.extname(topic_image_file_name).downcase
    new_file_name = nil

    loop do
      new_file_name = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
      break new_file_name unless NewsTopicImage.where(:topic_image_file_name => new_file_name).exists?
    end

    self.original_file_name = topic_image_file_name
    self.topic_image.instance_write(:file_name, "#{new_file_name}#{extension}")
  end
end
