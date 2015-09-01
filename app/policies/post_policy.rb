class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope
  end
end