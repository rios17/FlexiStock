class CreateArticulos < ActiveRecord::Migration
  def self.up
    create_table :articulos do |t|
      t.string :nombre
      t.string :referencia
      t.integer :linea_producto_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articulos
  end
end
