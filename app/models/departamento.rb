class Departamento < ActiveRecord::Base

  belongs_to :pais
  has_many :municipios, :dependent => :destroy
   acts_as_chainable :to => :municipio, :from => :pais

end
