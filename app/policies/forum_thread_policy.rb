class ForumThreadPolicy < ApplicationController
  def edit?
    user.id == record.user.id
  end
end
