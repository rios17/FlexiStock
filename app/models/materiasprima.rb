class Materiasprima < ActiveRecord::Base

  belongs_to :articulo

  validates_presence_of :material, :message => ""

end
