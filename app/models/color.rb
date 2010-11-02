class Color < ActiveRecord::Base

    has_many :caracteristicas
    has_many :articulos

end
