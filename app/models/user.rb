class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def self.top_rated
    self.select('users.*') # select all attrib of user
    .select('COUNT(DISTINCT comments.id) AS comments_count') # count user's comments
    .select('COUNT(DISTINCT posts.id) AS posts_count') # count user's posts
    .select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank') # add the counts
    .joins(:posts) # joins posts table to users table (via user_id)
    .joins(:comments) # joins comments table to users table (via user_id)
    .group('users.id') # instructs database to group results so that each user is returned in a distinct row
    .order('rank DESC') # instructs database to order results in desc order, by the rank created in this query
    # (rank = comment count + post count)
  end

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def favorited(post)
    favorites.where(post_id: post.id).first
  end

  def voted(post)
    votes.where(post_id: post.id).first
  end
end
