class Despacho < ActiveRecord::Base

  belongs_to :cliente

  def nombrecompleto
    nombres= self.nombre+ ' '+ self.apellido
  end

end
