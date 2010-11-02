class Sede < ActiveRecord::Base
  has_many :existenciasedes
  has_many :articulos_clientes
end
