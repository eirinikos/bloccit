class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  # def show
  #   @post = Post.find(params[:post_id])
  # end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:body))
    @summary.post = @post
    # @summary.user = current_user
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end
end
