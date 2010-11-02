class TiposMovimiento < ActiveRecord::Base

   has_many :movimientos_inventarios

end
