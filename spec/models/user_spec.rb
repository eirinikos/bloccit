require 'rails_helper'

describe User do

  include TestFactories

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user
      @favorite = @user.favorites.where(post: @post).create
    end

    it "returns 'nil' if the user has not favorited the post" do
      @favorite.destroy
      expect( @user.favorited(@post) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      expect( @user.favorited(@post) ).not_to be_nil
    end
  end
end