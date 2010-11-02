class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nit
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.string :email
      t.string :direccion
      t.integer :municipio_id
      t.integer :articulo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
