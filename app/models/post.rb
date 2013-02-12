class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments

  searchable :auto_index => true do
    text :title  ,:more_like_this => true
    text :body
    text :post_comments do
      comments.map { |i| i.body }
    end
  end

  def more_like
    results = Sunspot.more_like_this(self) do
      fields :title
      minimum_term_frequency 1
    end
  end
end
