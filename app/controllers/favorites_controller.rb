class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Post has been favorited!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error favoriting the post. Try again!"
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(params[:post_id])
    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Favorite has been unfavorited!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error unfavoriting the post. Try again!"
      redirect_to [post.topic, post]
    end
  end
end
