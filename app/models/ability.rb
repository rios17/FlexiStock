class Ability

  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.role? :administrador
         can :manage, :all
      elsif user.role? :encargadobodega
         can :read, Existencia
         can :create, Existencia
         can :update, Existencia do |existencia|
            existencia.try(:user) == user
         end
         can :read, Color
         can :create, Color
         can :update, Color do |color|
            color.try(:user) == user
         end
         can :read, LineasProducto
         can :create, LineasProducto
         can :update, LineasProducto do |lineas_producto|
            lineas_producto.try(:user) == user
            end
         can :read, MateriasPrima
         can :create, MateriasPrima
         can :update, MateriasPrima do |materiasprima|
           materiasprima.try(:user) == user
         end
         can :read, Articulo
         can :create, Articulo
         can :update, Articulo
         can :destroy, Articulo do |articulo|
              articulo.try(:user) == user
         end

         elsif user.role? :encargadodespacho
         can :read, Cliente
         can :create, Cliente
         can :update, Cliente do |cliente|
             cliente.try(:user) == user
         end
         elsif user.role? :vendedor
         can :read, TiposMovimiento
         can :create, TiposMovimiento
         can :update, TiposMovimiento
         can :read, MovimientosInventario
         can :create, MovimientosInventario
         can :update, MovimientosInventario
      end
    end
end