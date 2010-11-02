class MovimientosInventario < ActiveRecord::Base

  belongs_to :tipos_movimiento
  belongs_to :articulo

end
