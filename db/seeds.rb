# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |i|
  p = Post.new(:title => Faker::Lorem.sentence, :body => Faker::Lorem.paragraph[0..50] )
  2.times do |j|
    p.comments.build(:body => Faker::Lorem.sentence)
  end
  p.save
end
