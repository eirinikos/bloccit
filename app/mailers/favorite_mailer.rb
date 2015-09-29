class FavoriteMailer < ApplicationMailer
  default from: "eirinikos@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@kao-bloccit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@kao-bloccit.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@kao-bloccit.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
