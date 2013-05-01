module Users::Roles
  extend ActiveSupport::Concern
  
  included do
    include RoleModel

    roles :admin, :regular

    after_initialize :set_default_role
  end
  
  def set_default_role
    self.role ||= :regular
  end

  def role
    self.roles.first.try(:to_sym)
  end
  
  def role=(role)
    self.roles = [role]
  end
end
