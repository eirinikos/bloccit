require 'rails_helper'

describe Vote do
  
  describe "validation methods" do

    before do
      @valid_vote = Vote.create(value: -1)
      @invalid_vote = Vote.create(value: 3)
    end

    describe '#valid?' do
      it "only allows -1 or 1 as values" do
        expect( @valid_vote.valid?).to eq(true)
        expect( @invalid_vote.valid?).to eq(false)
      end
    end
  end

end