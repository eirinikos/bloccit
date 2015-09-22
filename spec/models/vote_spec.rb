require 'rails_helper'

describe Vote do
  
  describe "validation" do
    describe '#valid?' do
      it "only allows -1 or 1 as values" do
        expect( @valid_vote.valid?).to eq(true)
      end
    end
  end
  
end