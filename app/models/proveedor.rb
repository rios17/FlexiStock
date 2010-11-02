class Proveedor < ActiveRecord::Base
  has_many :compras

      def self.search(search, page)
          paginate :per_page => 2,
          :page => page,
          :conditions => ['nombres like ?', "%#{search}%"],
          :order => 'nombres'
      end

end
