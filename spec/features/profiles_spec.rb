require 'rails_helper'

describe "visiting profiles" do
  
  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = authenticated_user
    # this user is not signed in
    # test user is nil
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, body: "A Comment", post: @post)
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save!
  end

  describe "- while signed in -" do
    
    before do
      login_as(@user, scope: :user)
    end

    it "shows profile" do
      visit(user_path(@user))
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end

  describe "- while not signed in -" do
    it "shows profile" do
      visit(user_path(@user))
      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end
end