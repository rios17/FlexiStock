class Cliente < ActiveRecord::Base

  belongs_to :municipio, :dependent => :destroy
  has_many :articulos, :dependent => :destroy
  has_many :contactos, :dependent => :destroy
  has_many :articulos_clientes, :dependent => :destroy

  has_attached_file :foto,
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>",
                                 :small => "170x220#" },
                                 :default_url => "foto.png"

    def self.search(search, page)
          paginate :per_page => 4,
          :page => page,
          :conditions => ['nombre like ?', "%#{search}%"],
          :order => 'nombre'
   end

  def nombrecompleto
    nombres= self.nombre+ ' '+ self.apellido
  end


end

