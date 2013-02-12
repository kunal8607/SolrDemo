class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments  ,:dependent => :destroy

  validates :title, :body,  presence: true

  after_update :update_index

  searchable :auto_index => true do
    text :title  ,:more_like_this => true
    text :body ,:more_like_this => true
    text :post_comments do
      comments.map { |i| i.body }
    end
  end

  def more_like
    results = Sunspot.more_like_this(self) do
      fields :title , :body
      minimum_term_frequency 5
    end
  end

  private
  def update_index
    puts "*"*1000

    index
  end
end
