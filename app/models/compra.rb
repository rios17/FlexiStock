class Compra < ActiveRecord::Base
  belongs_to :proveedor

     def self.search(search, page)
          paginate :per_page => 2,
          :page => page,
          :conditions => ['articulo like ?', "%#{search}%"],
          :order => 'articulo'
      end

end
