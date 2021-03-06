class User < ActiveRecord::Base
  acts_as_authentic


  has_many :articulos
  has_many :clientes

      named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

    ROLES = %w[administrador encargadobodega encargadodespacho vendedor]

    def roles=(roles)
        self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
    end

    def roles
        ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
    end

    def role?(role)
        roles.include? role.to_s
    end


end
