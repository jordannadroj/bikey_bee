class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   true
  # end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    @user == @record.user
  end
end
