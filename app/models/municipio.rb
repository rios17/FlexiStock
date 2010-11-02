class Municipio < ActiveRecord::Base

   belongs_to :departamento
   has_many :clientes
   validates_presence_of :name
   acts_as_chainable :select_label => 'Municipio', :from => :departamento
  

end
