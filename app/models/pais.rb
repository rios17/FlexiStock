class Pais < ActiveRecord::Base

  has_many :clientes
  has_many :departamentos, :dependent => :destroy
  validates_presence_of :name
  acts_as_chainable :to => :departamento, :root => true


end
