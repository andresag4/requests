class RolePolicy < ApplicationPolicy
  class ScopeActions < ScopeActions
    def collection_scope
      case @user.role_scope
        when 'total'
          scope.all
        when 'site', 'owner'
          scope.where.not(scope: 0)
        else
          scope.none
      end
    end
  end
end
