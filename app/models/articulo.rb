class Articulo < ActiveRecord::Base

  belongs_to :lineas_producto
  has_many :materiasprimas
  has_many :existenciasedes
  has_many :movimientos_inventarios
  belongs_to :cliente
  has_many :articulos_clientes
  belongs_to :color

    def self.search(search, page)
          paginate :per_page => 4,
          :page => page,
          :conditions => ['UPPER(nombre) like ?', "%#{search}%".upcase],
          :order => 'nombre'
   end


  has_attached_file :foto,
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>",
                                 :small => "170x220#" },
                                 :default_url => "foto.png"

  def articuloreferencia
    articureferencia= self.nombre+ ' '+ self.referencia
  end

  def cantidadd
    articulosede.cantidad + articulo
  end

  validates_presence_of :nombre, :message => ""
  validates_presence_of :referencia, :message => ""
  validates_presence_of :marca, :message => ""
  validates_presence_of :peso, :message => ""
  validates_presence_of :talla, :message => ""
  validates_presence_of :lote, :message => ""
  validates_presence_of :ubicacion, :message => ""
  validates_presence_of :lineas_producto_id, :message => ""
  validates_presence_of :color_id, :message => ""
  

end
