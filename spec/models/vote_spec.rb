require 'rails_helper'

describe Vote do
  
  describe "validation methods" do

    before do
      # @valid_upvote = Vote.create(value: 1)
      # @valid_downvote = Vote.create(value: -1)
      # @invalid_vote = Vote.create(value: 3)
      @post = Post.create(title: 'Post title', body: 'Post bodies must be pretty long.')
      @valid_upvote  = Vote.create(value: 1, post: @post)
      @valid_downvote  = Vote.create(value: -1, post: @post)
      @invalid_vote  = Vote.create(value: 3, post: @post)
    end

    describe '#valid?' do
      it "only allows -1 or 1 as values" do
        expect( @valid_upvote.valid?).to eq(true)
        expect( @valid_downvote.valid?).to eq(true)
        expect( @invalid_vote.valid?).to eq(false)
      end
    end
  end

end