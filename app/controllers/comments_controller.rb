class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment=post.comments.build(params[:comment])
    #comment.save
    post.save
    redirect_to post_path(post)
  end
end
