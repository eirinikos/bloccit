class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])  
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.user = current_user
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
    end
  end
end
