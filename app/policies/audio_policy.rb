class AudioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    record_user = user
  end

  def index?
    record_user = user
  end

  def audios_by_users?
    record_user = user
  end
end
