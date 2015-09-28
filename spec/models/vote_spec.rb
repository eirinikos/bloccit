require 'rails_helper'

describe Vote do

  include TestFactories
  
  describe "validation methods" do

    before do
      # @valid_upvote = Vote.create(value: 1)
      # @valid_downvote = Vote.create(value: -1)
      # @invalid_vote = Vote.create(value: 3)
      post = associated_post
      @valid_upvote  = Vote.create(value: 1, post: post)
      @valid_downvote  = Vote.create(value: -1, post: post)
      @invalid_vote  = Vote.create(value: 3, post: post)
    end

    describe '#valid?' do
      it "only allows -1 or 1 as values" do
        expect( @valid_upvote.valid?).to eq(true)
        expect( @valid_downvote.valid?).to eq(true)
        expect( @invalid_vote.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end
