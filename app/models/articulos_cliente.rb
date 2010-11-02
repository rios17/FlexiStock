class ArticulosCliente < ActiveRecord::Base

  belongs_to :articulo
  belongs_to :cliente
  belongs_to :sede
  has_many :despachos, :dependent => :destroy

  before_create :descontar


      def cliente_nombre
       cliente.nombre if cliente
    end
    def cliente_nombre=(nombre)
        self.cliente = Cliente.find_or_create_by_nombre(nombre) unless nombre.blank?
    end




    private
  def descontar
      cant = 0
      es = Existenciasede.find(:first,
        :conditions => ["articulo_id = ? and sede_id = ?", self.articulo_id, self.sede_id])

      if es.cantidad.to_i >= self.total_articulos.to_i
         cant = es.cantidad.to_i - self.total_articulos
         es.update_attributes(:cantidad => cant)
      else

      end

  end


end
