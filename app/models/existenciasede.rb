class Existenciasede < ActiveRecord::Base
  belongs_to :sede
  belongs_to :articulo


        def self.search(search, page)
          paginate :per_page => 5,
          :page => page,
          :conditions => ['cantidad like ?', "%#{search}%"],
          :order => 'cantidad'
      end

      def self.exis_x_sede(cantidades)
          exis = {}
          i = ""

          cantidades.each do |r|
             #i = Sede.find_by_sql "Select s.nombre as nombre From sedes s WHERE id ="+ r.sede_id.to_s
             i = r.sede.nombre
             exis[i] = r.cantidad.to_i
          end
          return exis
      end

      def self.descontar(cantidad, id_articulo, id_sede)
          existencia = Existenciasede.find(:first, :conditions => ["articulo_id = ? and sede_id = ?", id_articulo, id_sede])
          if existencia.cantidad >= cantidad
             existencia.cantidad = existencia.cantidad - cantidad
             Existenciasede.update_all("cantidad ="+ existencia.cantidad.to_s,["id = ?", existencia.id])
          end
      end

      #esto o funciona
  def self.suma
    suma=0
    cantidad= Cantidad.find_all_by_articulo_id(id_articulo)
    cantidad.each do |i|
      articulo = Articulo.find(i.articulo_id)
      suma = suma + articulo
    end
    return suma
  end


  def self.cantidad
    x = Articulosede.cantidad
  end
     #esto o funciona
end
