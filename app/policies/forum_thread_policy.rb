class ForumThreadPolicy < ApplicationPolicy
  def edit?
    user.id == record.user.id
  end
  def update?
    user.id == record.user.id    
  end
end
