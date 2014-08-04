class EventPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  alias :show? :index?
  alias :update? :index?
  alias :create? :index?
  alias :destroy? :index?
end
