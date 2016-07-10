class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where.not(id: @user.id)
    end
  end
end
