class Contacto < ActiveRecord::Base

    belongs_to :cliente


    def nombrecompleto
    nombres= self.nombre+ ' '+ self.apellido
  end


    def cliente_nombre
       cliente.nombre if cliente
    end

    def cliente_nombre=(nombre)#BUSCAR EL UPCASE
        self.cliente = Cliente.find_or_create_by_nombre(nombre) unless nombre.blank?
    end

end