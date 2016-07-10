class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def has_total_scope?
    case @user.role_scope
      when 'total'
        true
      else
        false
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def general_policy(record = nil, query = nil, devise_controller = nil)
    if Rails.configuration.x.special_controllers.include? record.to_s.downcase
      record = record.to_s.singularize.capitalize
    else
      record = record.to_s.pluralize
    end
    if devise_controller
      devise_controller = devise_controller.to_s.pluralize
      permission = Permission.find_by_controller_and_action(devise_controller, query.to_s)
    else
      permission = Permission.find_by_controller_and_action(record, query.to_s)
    end
    user.role.permissions.include?(permission)
  end

  class Scope
    attr_reader :user, :scope, :identifier

    def initialize(user, scope, identifier = nil)
      @user = user
      @scope = scope
      @identifier = identifier.to_i
    end

    def resolve
      scope
    end

    def unauthorized_error
      raise Pundit::NotAuthorizedError
    end
  end

  class ScopeActions
    attr_reader :user, :scope, :identifier

    def initialize(user, scope, identifier = nil)
      @user = user
      @scope = scope
      @identifier = identifier.to_i
    end

    def unauthorized_error
      raise Pundit::NotAuthorizedError
    end
  end
end
