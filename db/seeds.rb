# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 5.times do |i|
#   NewsMainTopic.create!(:topic_name => "Topic #{i}")
# end

User.create!(:name => 'Admin User', :role => User::ADMIN_USER, :email => 'admin@gmail.com', :password => 'testapp1')

User.create!(:name => 'Member User', :role => User::MEMBER_USER, :email => 'member@gmail.com', :password => 'testapp1')

# FactoryGirl.create_list :news_topic, 50
