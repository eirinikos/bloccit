module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true, autolink: true, quote: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def up_vote_link_classes
    # return a string with the appr. classes for an upvote link
    if (current_user.voted(post) && current_user.voted(post).up_vote?)
      'voted'
    else
      ''
      "glyphicon glyphicon-chevron-up voted"
    end
  end

  def down_vote_link_classes
    # return a string with the appr. classes for a downvote link
    #{(current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : '' }
  end
end
